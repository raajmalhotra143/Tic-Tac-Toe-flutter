# Codebase Concerns

**Analysis Date:** 2025-02-13

## Tech Debt

**Business Logic in UI:**
- Issue: Game state management and win/loss logic are implemented directly within the State classes of screens rather than being encapsulated in dedicated view models or controllers.
- Files: `lib/screens/offline_game_screen.dart`, `lib/screens/online_game_screen.dart`
- Impact: Makes the code harder to test, maintain, and reuse. Logic changes require modifying UI files.
- Fix approach: Extract game logic into a `GameController` or use a more robust state management pattern (e.g., Bloc or specialized Providers) to separate concerns.

**Large Widget Files:**
- Issue: Screen widgets are becoming large and complex, handling everything from animations to network streams.
- Files: `lib/screens/offline_game_screen.dart` (514 lines), `lib/screens/online_game_screen.dart` (367 lines)
- Impact: Decreased readability and higher risk of side-effect bugs.
- Fix approach: Break down screens into smaller, reusable widgets and extract logic into services or providers.

## Known Bugs

- No specific functional bugs were identified during the initial mapping, but the lack of tests suggests a high probability of edge-case bugs in game state transitions.

## Security Considerations

**Permissive Firestore Rules:**
- Risk: Any authenticated user can read or write to any document in the `matches` and `matchmaking` collections.
- Files: `firestore.rules`
- Current mitigation: Basic authentication check (`if request.auth != null`).
- Recommendations: Implement stricter rules to ensure users can only modify matches they are participating in and only when it is their turn.

## Performance Bottlenecks

**Frequent Rebuilds:**
- Problem: The use of `StreamBuilder` in `OnlineGameScreen` and local `setState` in `OfflineGameScreen` for the entire board might lead to unnecessary rebuilds of the entire screen on every move.
- Files: `lib/screens/online_game_screen.dart`, `lib/screens/offline_game_screen.dart`
- Cause: Tightly coupled state and UI.
- Improvement path: Use `ValueListenableBuilder` or fine-grained `Consumer` widgets to rebuild only the specific cell that changed.

## Fragile Areas

**Online Match Consistency:**
- Files: `lib/screens/online_game_screen.dart`, `lib/services/matchmaking_service.dart`
- Why fragile: The system relies on client-side logic to determine turns and winners, which is then written to Firestore. Since rules are permissive, a malicious client could potentially spoof moves or declare themselves the winner.
- Safe modification: Move game authority to a backend (e.g., Firebase Cloud Functions) or implement robust validation in Firestore Rules.
- Test coverage: Zero coverage for online match synchronization.

## Scaling Limits

**Matchmaking Collection:**
- Current capacity: Small scale.
- Limit: As the user base grows, the current matchmaking strategy (polling or broad streams) might lead to performance issues and high Firestore costs.
- Scaling path: Implement a more robust matchmaking queue using Cloud Functions or a dedicated matchmaking service.

## Missing Critical Features

**Error Recovery:**
- Problem: Limited handling for network interruptions during online play.
- Blocks: Users might get stuck in a "hanging" match state if the connection is lost.

## Test Coverage Gaps

**Unit Tests:**
- What's not tested: `AiService` logic, `MatchModel` parsing, `AppState` transitions.
- Files: `lib/services/ai_service.dart`, `lib/models/match_model.dart`, `lib/providers/app_state.dart`
- Risk: Regressions in game logic or state handling could go unnoticed.
- Priority: High

**Integration Tests:**
- What's not tested: End-to-end flow from matchmaking to game completion.
- Files: `lib/screens/matchmaking_screen.dart`, `lib/screens/online_game_screen.dart`
- Risk: Broken user journeys due to service integration failures.
- Priority: Medium

---

*Concerns audit: 2025-02-13*
