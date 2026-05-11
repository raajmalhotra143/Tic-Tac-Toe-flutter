# Domain Pitfalls: Professional Tic-Tac-Toe

**Domain:** Competitive Casual Gaming
**Researched:** 2025-05-24

## Critical Pitfalls

Mistakes that cause rewrites or major player frustration.

### Pitfall 1: Matchmaking Race Conditions
**What goes wrong:** Two players join a "waiting" match at the exact same microsecond, resulting in a 3-player match or a crashed game state.
**Prevention:** Use Postgres `FOR UPDATE SKIP LOCKED` in an RPC function to ensure atomic operations.

### Pitfall 2: Floating-Point "Glow" Smearing (OLED)
**What goes wrong:** On older OLED screens, high-contrast neon elements (e.g., bright pink on pure black) "smear" when the screen scrolls or elements move.
**Prevention:** Use deep charcoals (`#121212`) instead of pure black and apply a subtle "Acrylic" or "Mica" blur to moving elements.

### Pitfall 3: AI "Robotic" Speed
**What goes wrong:** The AI moves instantly after the player, making it feel robotic and jarring.
**Prevention:** Implement a artificial "Thinking Delay" (500ms - 1.5s) to simulate a human opponent, even on "Impossible" mode.

## Moderate Pitfalls

### Pitfall 1: State Desync in Real-time
**What goes wrong:** Player A sees a move that Player B doesn't, or the board state gets corrupted due to packet loss.
**Prevention:** Always treat the Supabase Database as the Source of Truth. Re-fetch or re-sync the full board state if a realtime event is missed (sequence numbers).

### Pitfall 2: Star-Gating Frustration
**What goes wrong:** Players can't progress to "World 2" because they missed 1 star in a very difficult level.
**Prevention:** Ensure the "threshold" for progression is generous, while the "perfectionist" rewards are high.

## Phase-Specific Warnings

| Phase Topic | Likely Pitfall | Mitigation |
|-------------|---------------|------------|
| Matchmaking | Ghost sessions. | Use Supabase Presence to cleanup "abandoned" matches. |
| AI Integration | Recursion depth. | Tic-Tac-Toe is only 9 levels deep, but for larger boards (15x15), Minimax will crash without pruning. |
| UI/UX | Eye strain from neon. | Use desaturated "Milky" neons for static elements; vivid neons for feedback. |

## Sources
- StackOverflow: "Supabase matchmaking race conditions".
- Reddit r/gamedev: "Why Tic-Tac-Toe is harder than it looks".
- UI/UX Research: "Dark mode halation and OLED smearing".
