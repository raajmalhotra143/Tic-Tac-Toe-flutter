# Phase 1: Foundation & Infrastructure - Research

**Researched:** 2026-05-11
**Domain:** Flutter, Supabase, Riverpod, Local Persistence
**Confidence:** HIGH

## Summary

This research establishes the technical foundation for Neon Tic-Tac-Toe (Pro), focusing on the transition from Firebase/Provider to a robust Supabase/Riverpod architecture. The primary goal is to support a high-fidelity real-time multiplayer experience alongside a strictly enforced 45-stage offline progression system.

**Primary recommendation:** Use **Supabase** for real-time matchmaking via Postgres RPC (`SKIP LOCKED`), **Isar Community** for ACID-compliant local progression tracking, and **Riverpod** with code generation for state management.

## Architectural Responsibility Map

| Capability | Primary Tier | Secondary Tier | Rationale |
|------------|-------------|----------------|-----------|
| User Authentication | Supabase Auth | API Tier | Secure session management and identity. |
| Matchmaking | Supabase (Postgres) | — | Needs atomic `SKIP LOCKED` to prevent double-matching. |
| Game State Sync | Supabase Realtime | — | Low-latency broadcast of board moves. |
| Progression Logic | Client (Flutter) | Local DB | 45-stage logic resides on-device for offline play. |
| AI (Minimax) | Client (Flutter) | — | Ensures instant moves without network latency. |
| Persistent Storage | Isar (Local) | — | High-performance, ACID storage for "Zero Drift". |

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| `supabase_flutter` | `2.12.4` | Backend/Realtime | Robust Postgres integration + Realtime Channels. [VERIFIED: pub.dev] |
| `flutter_riverpod` | `3.3.1` | State Management | Reactive caching, compile-time safety. [VERIFIED: pub.dev] |
| `isar_community` | `3.3.2` | Local Database | Faster than SQLite, ACID, built-in migrations. [VERIFIED: pub.dev] |
| `riverpod_generator` | `3.0.0` | Code Generation | Reduces boilerplate, ensures correct Provider usage. [ASSUMED] |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|--------------|
| `google_fonts` | `6.2.1` | Typography | Neon aesthetic (e.g., 'Orbitron', 'Roboto Mono'). [CITED: pub.dev] |
| `path_provider` | `2.1.3` | File Paths | Locating Isar database storage. [VERIFIED: pub.dev] |
| `json_annotation` | `4.9.0` | Serialization | Converting Supabase responses to models. [VERIFIED: pub.dev] |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| `isar` | `sqflite` | SQLite is more stable but has significant boilerplate and slower performance for NoSQL-like stage data. |
| `provider` | `riverpod` | Riverpod handles async states (loading/error) much more cleanly than Provider. |

**Installation:**
```bash
# Add Core Dependencies
flutter pub add supabase_flutter flutter_riverpod isar_community isar_flutter_libs path_provider google_fonts

# Add Dev Dependencies
flutter pub add dev:riverpod_generator dev:riverpod_annotation dev:isar_generator dev:build_runner dev:custom_lint dev:riverpod_lint
```

## Architecture Patterns

### Recommended Project Structure
```
lib/
├── features/
│   ├── auth/           # Supabase Login/Profiles
│   ├── game/           # Tic-Tac-Toe Logic & AI
│   ├── matchmaking/    # Online Queue & Match Creation
│   └── progression/    # Offline Stages & Local DB
├── shared/
│   ├── providers/      # Global Supabase/Isar clients
│   ├── theme/          # Neon Design System
│   └── widgets/        # GlassPanel, NeonButton
└── main.dart
```

### Pattern 1: Skip Locked Matchmaking
**What:** Use Postgres `SELECT ... FOR UPDATE SKIP LOCKED` to create a race-condition-free queue.
**When to use:** Multi-user matchmaking in real-time.
**Example:**
```sql
-- Source: [ASSUMED: PostgreSQL Best Practices]
CREATE OR REPLACE FUNCTION join_matchmaking()
RETURNS uuid AS $$
DECLARE
  opponent_id uuid;
  new_match_id uuid;
BEGIN
  -- Find opponent not currently locked by another transaction
  SELECT player_id INTO opponent_id
  FROM matchmaking_queue
  WHERE player_id != auth.uid()
  ORDER BY created_at ASC
  FOR UPDATE SKIP LOCKED
  LIMIT 1;

  IF opponent_id IS NOT NULL THEN
    DELETE FROM matchmaking_queue WHERE player_id = opponent_id;
    INSERT INTO matches (player_x, player_o, status)
    VALUES (auth.uid(), opponent_id, 'ongoing')
    RETURNING id INTO new_match_id;
    RETURN new_match_id;
  ELSE
    INSERT INTO matchmaking_queue (player_id) VALUES (auth.uid())
    ON CONFLICT (player_id) DO NOTHING;
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;
```

### Anti-Patterns to Avoid
- **Hardcoding Keys:** Never commit Supabase URLs/Keys. Use `--dart-define-from-file`.
- **Global Provider Access:** Avoid using `ref.read` in build methods; use `ref.watch`.
- **Floating State:** Don't keep game state in UI widgets; use a `Notifier` or `AsyncNotifier`.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Real-time Sync | Custom Socket logic | Supabase Realtime | Handles reconnection, presence, and DB-sync automatically. |
| Auth UI | Custom forms | `supabase_auth_ui` | (Optional) Handles all edge cases, but for Neon UI, custom is preferred with Supabase Auth SDK. |
| Data Serialization | Manual JSON parsing | `json_serializable` | Reduces bugs in mapping Postgres columns to Dart objects. |

## Common Pitfalls

### Pitfall 1: RLS Policy Deadlocks
**What goes wrong:** Complex RLS policies can cause performance hits or recursion errors.
**How to avoid:** Keep RLS simple. Use Postgres functions for complex checks.

### Pitfall 2: Isar Type Safety
**What goes wrong:** Changing Isar models without running `build_runner`.
**How to avoid:** Always run `dart run build_runner build --delete-conflicting-outputs` after model changes.

## Code Examples

### Secure Environment Config
```dart
// lib/shared/config/env_config.dart
class EnvConfig {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
}

// config.json (Git-ignored)
{
  "SUPABASE_URL": "https://xyz.supabase.co",
  "SUPABASE_ANON_KEY": "eyJhbG..."
}
```

## Assumptions Log

| # | Claim | Section | Risk if Wrong |
|---|-------|---------|---------------|
| A1 | `riverpod_generator` v3.0.0 is stable | Standard Stack | May need to downgrade to 2.x if plugins are incompatible. |
| A2 | `SKIP LOCKED` works on all Supabase tiers | Pattern 1 | Free tier might have limitations, but usually supports standard Postgres features. |

## Environment Availability

| Dependency | Required By | Available | Version | Fallback |
|------------|------------|-----------|---------|----------|
| Flutter SDK | UI / Logic | ✓ | 3.22.0+ | — |
| Supabase Project | Backend | ✓ | — | Local Docker Supabase |
| Android Emulator | Testing | ✓ | API 34 | Web Preview |

## Validation Architecture

### Test Framework
| Property | Value |
|----------|-------|
| Framework | `flutter_test` |
| Mocking | `mockito` or `mocktail` |
| Quick run | `flutter test` |

### Wave 0 Gaps
- [ ] `test/infrastructure_test.dart` — Verify Isar and Supabase client initialization.

## Security Domain

### Applicable ASVS Categories

| ASVS Category | Applies | Standard Control |
|---------------|---------|-----------------|
| V2 Authentication | Yes | Supabase Auth (JWT) |
| V5 Input Validation | Yes | Isar static typing + Supabase RLS |
| V6 Cryptography | Yes | Supabase handles TLS/Encryption at rest |

### Known Threat Patterns

| Pattern | STRIDE | Standard Mitigation |
|---------|--------|---------------------|
| Insecure Direct Object Reference | Information Disclosure | Supabase Row Level Security (RLS) |
| Credential Leak | Information Disclosure | `--dart-define-from-file` + `.gitignore` |

## Sources

### Primary (HIGH confidence)
- `pub.dev` - Package versions and availability.
- `supabase.com/docs` - Realtime and Matchmaking patterns.
- `riverpod.dev` - Documentation for Riverpod 3.x patterns.

### Secondary (MEDIUM confidence)
- `isar.dev` - Isar setup guides (transition to Community fork).
