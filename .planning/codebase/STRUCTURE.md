# Codebase Structure

**Analysis Date:** 2025-02-14

## Directory Layout

```
lib/
├── models/         # Data models and value objects
├── providers/      # Application state management (Provider)
├── router/         # Routing and navigation configuration
├── screens/        # Top-level UI pages/screens
├── services/       # Business logic, API calls, and external services
├── theme/          # App-wide visual styling (ThemeData)
├── widgets/        # Reusable UI components
├── main.dart       # App entry point
└── firebase_options.dart # Generated Firebase configuration
test/               # Unit and widget tests
android/            # Android platform-specific code
web/                # Web platform-specific code
```

## Directory Purposes

**lib/models/:**
- Purpose: Defines the shape of data used in the app.
- Contains: Plain Dart classes, often with JSON serialization logic if needed.
- Key files: `match_model.dart`, `stage_progress.dart`.

**lib/providers/:**
- Purpose: Contains state management logic using the `provider` package.
- Contains: `ChangeNotifier` classes that hold reactive state.
- Key files: `app_state.dart`.

**lib/router/:**
- Purpose: Manages app navigation.
- Contains: `go_router` configuration and route definitions.
- Key files: `app_router.dart`.

**lib/screens/:**
- Purpose: Full-screen widgets that represent different views in the app.
- Contains: Stateful and Stateless widgets that compose other widgets.
- Key files: `game_screen.dart`, `welcome_screen.dart`, `auth_screen.dart`.

**lib/services/:**
- Purpose: Handles communication with external systems and complex logic.
- Contains: API clients, database wrappers, and algorithmic logic.
- Key files: `auth_service.dart`, `ai_service.dart`, `matchmaking_service.dart`, `local_storage_service.dart`.

**lib/widgets/:**
- Purpose: Small, reusable UI building blocks.
- Contains: Atomic widgets used across multiple screens.
- Key files: `game_board.dart`, `glass_panel.dart`.

## Key File Locations

**Entry Point:**
- `lib/main.dart`: Root widget and service initialization.

**Configuration:**
- `pubspec.yaml`: Project dependencies and assets.
- `firebase_options.dart`: Firebase connection strings.
- `lib/theme/app_theme.dart`: Centralized visual styles.

**Core Logic:**
- `lib/providers/app_state.dart`: Manages global user state and progress.
- `lib/services/ai_service.dart`: Tic-Tac-Toe move calculation logic.

**Testing:**
- `test/widget_test.dart`: Basic smoke test for the app.

## Naming Conventions

**Files:**
- snake_case: `game_screen.dart`, `app_state.dart`.

**Directories:**
- snake_case: `models`, `services`.

**Classes:**
- PascalCase: `AppState`, `AuthService`.

## Where to Add New Code

**New Feature (e.g., Leaderboard):**
- Primary state/logic: `lib/providers/leaderboard_provider.dart`
- New screen: `lib/screens/leaderboard_screen.dart`
- API interaction: `lib/services/leaderboard_service.dart`
- Data model: `lib/models/leaderboard_entry.dart`

**New Component/Module:**
- Implementation: `lib/widgets/custom_button.dart`

**Utilities:**
- Shared helpers: `lib/services/utils.dart` (or `lib/core/utils.dart` if created).

## Special Directories

**android/:**
- Purpose: Native Android configuration (Manifest, Gradle, resources).
- Generated: No
- Committed: Yes

**web/:**
- Purpose: Native Web configuration (index.html, manifest.json).
- Generated: No
- Committed: Yes

---

*Structure analysis: 2025-02-14*
