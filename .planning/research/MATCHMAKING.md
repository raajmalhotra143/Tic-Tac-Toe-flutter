# Real-time Matchmaking: Supabase Implementation

**Domain:** Real-time Backend / Multi-player Gaming
**Researched:** 2025-05-24

## Architecture: The "Atomic Queue"

To prevent race conditions where multiple players join the same 1v1 slot, the matchmaking logic must happen inside the database using **Postgres Row-Level Locking**.

### 1. Database Schema

```sql
create table matches (
  id uuid primary key default uuid_generate_v4(),
  player1_id uuid references auth.users,
  player2_id uuid references auth.users,
  status text check (status in ('waiting', 'active', 'finished')),
  board jsonb default '[null, null, null, null, null, null, null, null, null]',
  current_turn uuid references auth.users,
  winner_id uuid references auth.users,
  created_at timestamp with time zone default now()
);
```

### 2. Atomic RPC Function

This function is the "single source of truth" for joining a game.

```sql
create or replace function join_matchmaking()
returns uuid as $$
declare
  target_match_id uuid;
begin
  -- Try to find a 'waiting' match
  select id into target_match_id
  from matches
  where status = 'waiting'
    and player1_id != auth.uid() -- Don't match with self
  limit 1
  for update skip locked; -- CRITICAL: Atomically locks the row

  if target_match_id is not null then
    -- Found a match! Join it.
    update matches
    set 
      player2_id = auth.uid(),
      status = 'active',
      current_turn = player1_id -- Player 1 goes first
    where id = target_match_id;
    
    return target_match_id;
  else
    -- No match found. Create a new one.
    insert into matches (player1_id, status)
    values (auth.uid(), 'waiting')
    returning id into target_match_id;
    
    return target_match_id;
  end if;
end;
$$ language plpgsql security definer;
```

### 3. Real-time Flow (Client Side)

1. **Join Queue:** Client calls `supabase.rpc('join_matchmaking')`.
2. **Listen:** Client subscribes to the specific match ID.
   ```dart
   final subscription = supabase
     .from('matches:id=eq.$matchId')
     .stream(primaryKey: ['id'])
     .listen((data) {
       // Update UI if player2_id is now set
     });
   ```
3. **Presence:** Use Supabase Presence to detect if the opponent disconnects. If they "leave" the channel, trigger a 30-second countdown before awarding the win to the remaining player.

## Best Practices

- **Timeout:** Implement a cleanup cron job (e.g., using pg_cron or Edge Functions) to delete 'waiting' matches older than 5 minutes.
- **Latency:** For move updates, use **Supabase Broadcast** for ephemeral visual feedback (e.g., "Opponent is hovering over square 4") and **Postgres Changes** for actual state persistence.
- **Validation:** Use a `CHECK` constraint or a Postgres Trigger to ensure a player only moves on their turn.

## Sources
- Supabase Guide: "Realtime Multiplayer Game".
- Postgres Documentation: "SELECT FOR UPDATE / SKIP LOCKED".
