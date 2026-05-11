# Technology Stack: Professional Tic-Tac-Toe

**Project:** Tic-Tac-Toe Pro
**Researched:** 2025-05-24

## Recommended Stack

### Core Framework
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| Flutter | 3.x | Cross-platform UI | High-performance rendering for neon effects and glassmorphism. |
| Riverpod | 2.x | State Management | Robust, testable, and reactive state handling. |

### Database & Backend
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| Supabase | Latest | Backend-as-a-Service | Realtime game state, Auth, and atomic Matchmaking via RPC. |
| PostgreSQL | 15+ | Game Storage | Reliable relational data with powerful locking for matchmaking. |

### Infrastructure
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| Supabase Edge Functions | - | Server-side Logic | Validation of moves to prevent cheating and AI calculation offloading. |
| Firebase AI SDK | - | Future GenAI | Potential for "AI Persona" chat or custom image generation. |

### Supporting Libraries
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| `google_fonts` | Latest | Typography | expressive neon-style fonts. |
| `supabase_flutter` | Latest | SDK | Client-side interaction with Supabase. |
| `glass_kit` or custom | - | UI Effects | implementing "Liquid Glass" panels. |

## Alternatives Considered

| Category | Recommended | Alternative | Why Not |
|----------|-------------|-------------|---------|
| Backend | Supabase | Firebase | Supabase offers better relational control for matchmaking queues (`SKIP LOCKED`). |
| State | Riverpod | Bloc | Riverpod is more ergonomic for fast iterative research projects. |

## Installation

```bash
# Core
flutter pub add supabase_flutter flutter_riverpod google_fonts

# Dev dependencies
flutter pub add dev:riverpod_generator dev:build_runner
```

## Sources
- Supabase Documentation (Realtime & RPC)
- Flutter Material 3 Design Guidelines
