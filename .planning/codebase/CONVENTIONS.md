# Coding Conventions

**Analysis Date:** 2025-02-13

## Naming Patterns

**Files:**
- `snake_case.dart` (e.g., `lib/models/match_model.dart`, `lib/screens/game_screen.dart`)

**Functions:**
- `camelCase` (e.g., `getMove`, `_easyMove`, `toJson`)

**Variables:**
- `camelCase` (e.g., `currentTurnUid`, `winnerUid`, `matchId`)

**Types:**
- `PascalCase` for Classes (e.g., `MatchModel`, `AiService`, `AppState`)
- `PascalCase` for Enums (e.g., `MatchStatus`, `GameDifficulty`)
- Enum values are `camelCase` (e.g., `MatchStatus.waiting`, `GameDifficulty.easy`)

## Code Style

**Formatting:**
- Dart standard formatting via `dart format .`
- Usage of `const` constructors where possible for performance (e.g., `const MatchModel(...)`, `const TicTacToeApp()`)

**Linting:**
- `flutter_lints` version `^5.0.0`
- Configured in `analysis_options.yaml`
- Includes standard rules from `package:flutter_lints/flutter.yaml`

## Import Organization

**Order:**
1. Flutter/Dart core imports (e.g., `package:flutter/material.dart`)
2. Third-party package imports (e.g., `package:firebase_core/firebase_core.dart`, `package:provider/provider.dart`)
3. Project-specific relative imports (e.g., `import 'theme/app_theme.dart'`)

**Path Aliases:**
- Not explicitly configured in `analysis_options.yaml` or `pubspec.yaml`. Relative imports are primarily used.

## Error Handling

**Patterns:**
- `try-catch` blocks for asynchronous operations (e.g., Firebase initialization in `lib/main.dart`)
- `debugPrint` for logging errors in debug mode.
- `mounted` checks before calling `setState` or using `BuildContext` after `await` (prescribed in `GEMINI.md`).

## Logging

**Framework:** `debugPrint` and `dart:developer` (as prescribed in `GEMINI.md`).

**Patterns:**
- `debugPrint("Message: $e")` for general error logging.
- `developer.log` for structured logging (e.g., with severity levels and categories).

## Comments

**When to Comment:**
- Descriptive comments for complex logic (e.g., AI move calculations in `lib/services/ai_service.dart`).
- Structural separators using box-drawing characters in some files.

**JSDoc/TSDoc:**
- Dart documentation comments `///` used for public methods (e.g., `AiService.getMove`).

## Function Design

**Size:** Generally small, focused functions.

**Parameters:** Named parameters are preferred for models and services (e.g., `MatchModel` constructor, `AiService.getMove`).

**Return Values:** Explicit return types are used.

## Module Design

**Exports:** Classes are typically defined in their own files and imported directly.

**Barrel Files:** Not extensively used, though some directories have a clear structure (e.g., `lib/services/`, `lib/models/`).

---

*Convention analysis: 2025-02-13*
