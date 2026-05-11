<!-- refreshed: 2025-02-14 -->
# Architecture

**Analysis Date:** 2025-02-14

## System Overview

```text
┌─────────────────────────────────────────────────────────────┐
│                      Presentation Layer                     │
│    (Screens, Widgets, Theme) `lib/screens`, `lib/widgets`   │
├──────────────────┬──────────────────┬───────────────────────┤
│   WelcomeScreen  │   GameScreen     │    GameBoard          │
└────────┬─────────┴────────┬─────────┴──────────┬────────────┘
         │                  │                     │
         ▼                  ▼                     ▼
┌─────────────────────────────────────────────────────────────┐
│                    State Management Layer                   │
│         (Provider) `lib/providers/app_state.dart`           │
└──────────────────┬──────────────────┬───────────────────────┘
         │                  │                     │
         ▼                  ▼                     ▼
┌─────────────────────────────────────────────────────────────┐
│                    Business & Data Services                 │
│         (Logic, API) `lib/services`, `lib/models`           │
└──────────────────┬──────────────────┬───────────────────────┘
         │                  │                     │
         ▼                  ▼                     ▼
┌─────────────────────────────────────────────────────────────┐
│            External (Firebase, LocalStorage)                │
└─────────────────────────────────────────────────────────────┘
```

## Component Responsibilities

| Component | Responsibility | File |
|-----------|----------------|------|
| AppState | Orchestrates global state, user preferences, and game progress. | `lib/providers/app_state.dart` |
| AuthService | Manages Firebase Authentication state and user sessions. | `lib/services/auth_service.dart` |
| AiService | Encapsulates game logic (Minimax) for the offline AI opponent. | `lib/services/ai_service.dart` |
| MatchmakingService | Handles Firestore-based matchmaking for online play. | `lib/services/matchmaking_service.dart` |
| LocalStorageService | Persists settings and progress using `shared_preferences`. | `lib/services/local_storage_service.dart` |
| AppRouter | Defines declarative navigation paths using `go_router`. | `lib/router/app_router.dart` |

## Pattern Overview

**Overall:** Layered Architecture

**Key Characteristics:**
- **Separation of Concerns:** Distinct layers for UI, state management, and business logic.
- **Provider Pattern:** Centralized state management using the `provider` package to decouple logic from widgets.
- **Service-Based Logic:** Complex logic (AI, matchmaking, auth) is moved into dedicated service classes.

## Layers

**Presentation Layer:**
- Purpose: Renders UI and handles user input.
- Location: `lib/screens`, `lib/widgets`
- Contains: Flutter Widgets, Screens, Custom Themes.
- Depends on: `lib/providers`, `lib/theme`, `lib/router`.
- Used by: Users.

**State Management Layer:**
- Purpose: Bridges the UI and Services; holds reactive state.
- Location: `lib/providers`
- Contains: `ChangeNotifier` classes.
- Depends on: `lib/services`, `lib/models`.
- Used by: Presentation Layer.

**Service Layer:**
- Purpose: Handles business logic and external integrations.
- Location: `lib/services`
- Contains: Static logic (AI), singleton-like services (Auth, Firestore).
- Depends on: `firebase_auth`, `cloud_firestore`, `shared_preferences`.
- Used by: State Management Layer.

## Data Flow

### Primary Request Path (Game Move)

1. User taps a cell on `GameBoard` (`lib/widgets/game_board.dart`).
2. Widget calls a method on `AppState` or triggers local logic in `OfflineGameScreen` (`lib/screens/offline_game_screen.dart`).
3. Logic layer processes the move (e.g., checks for winner via `AiService`).
4. State is updated, and `notifyListeners()` triggers UI rebuild.

### Authentication Flow

1. User submits credentials in `AuthScreen` (`lib/screens/auth_screen.dart`).
2. Calls `AuthService.login` or `register` (`lib/services/auth_service.dart`).
3. `AuthService` interacts with Firebase Auth.
4. On success, `AuthService` notifies listeners; UI redirects via `go_router` logic or local state check.

## Key Abstractions

**ChangeNotifier:**
- Purpose: Reactive state containers that notify the UI of changes.
- Examples: `lib/providers/app_state.dart`, `lib/services/auth_service.dart`.

**Service Classes:**
- Purpose: Logic encapsulation and API abstraction.
- Examples: `lib/services/ai_service.dart`, `lib/services/matchmaking_service.dart`.

## Entry Points

**Main Entry:**
- Location: `lib/main.dart`
- Triggers: App launch.
- Responsibilities: Initializes Firebase, LocalStorage, and wraps the app in a `MultiProvider`.

## Architectural Constraints

- **Single Threaded:** Standard Flutter/Dart event loop; heavy computation (AI) is currently handled on the main thread (but optimized with Minimax pruning).
- **Global state:** `AppState` is a singleton-like provider available throughout the widget tree.
- **Reactive UI:** Screens should avoid direct interaction with Services; they should go through Providers where possible.

## Anti-Patterns

### Logic in Widgets

**What happens:** Placing complex game rules or Firebase calls directly in `build` or widget methods.
**Why it's wrong:** Makes testing difficult and UI code bloated.
**Do this instead:** Move logic to `lib/services` or `lib/providers`.

## Error Handling

**Strategy:** Service-level catch blocks with UI-level messaging.

**Patterns:**
- **Friendly Errors:** `AuthService.friendlyError` maps Firebase codes to user-facing strings.
- **Try-Catch:** Used in Firebase initialization and async service calls.

---

*Architecture analysis: 2025-02-14*
