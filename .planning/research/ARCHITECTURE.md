# Architecture Patterns: Professional Tic-Tac-Toe

**Domain:** Real-time Turn-based Gaming
**Researched:** 2025-05-24

## Recommended Architecture

A hybrid architecture using **Riverpod** for local state management and **Supabase** for distributed state.

### Component Boundaries

| Component | Responsibility | Communicates With |
|-----------|---------------|-------------------|
| GameEngine | Board logic, Win detection, AI Minimax. | Local UI, Supabase (validation). |
| MatchmakingService | RPC calls to find/create matches. | Supabase RPC, Presence. |
| RealtimeProvider | Listens for board updates from opponent. | Supabase Realtime, GameState. |
| UI Layer | Neon-styled widgets, glassmorphism. | Riverpod Providers. |

### Data Flow

1. **User Input** → `GameStateProvider`
2. **Move Validation** → `GameEngine`
3. **Persist Move** → `Supabase (Postgres Table)`
4. **Broadcast** → `Supabase Realtime` → **Opponent UI**

## Patterns to Follow

### Pattern 1: Atomic Matchmaking (Postgres RPC)
**What:** Use a single database function to pair players.
**When:** Whenever a user clicks "Find Match".
**Example:**
```sql
-- Use FOR UPDATE SKIP LOCKED to prevent race conditions
select id from matches 
where status = 'waiting' 
limit 1 
for update skip locked;
```

### Pattern 2: Depth-Adjusted Minimax
**What:** Adjust AI scores based on depth to ensure "Impossible" mode is both perfect and efficient.
**Example:**
```dart
int minimax(Board board, int depth, bool isMax) {
  int score = evaluate(board);
  if (score == 10) return score - depth; // Fast win
  if (score == -10) return score + depth; // Slow loss
  // ...
}
```

## Anti-Patterns to Avoid

### Anti-Pattern 1: Client-Side Win Detection (Online)
**What:** Letting the client decide if they won in an online match.
**Why bad:** High risk of cheating/hacking via console.
**Instead:** Validate win condition in a Supabase Edge Function or via a Postgres Trigger/RPC.

## Scalability Considerations

| Concern | At 100 users | At 10K users | At 1M users |
|---------|--------------|--------------|-------------|
| Matchmaking | RPC is instant. | RPC is fine. | May need Redis/External Queue. |
| Realtime | Default Supabase. | Dedicated Realtime nodes. | Horizontal scaling of Realtime. |

## Sources
- Supabase Best Practices for Real-time Games.
- Riverpod 2.0 Architectural Patterns.
