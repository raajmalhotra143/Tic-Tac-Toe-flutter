# Phase 1 Verification: Foundation & Infrastructure

**Phase Goal:** Initialize Supabase, Riverpod, and Isar following a feature-first structure.
**Status:** ISSUES FOUND
**Plans Checked:** 01-01, 01-02, 01-03

## Summary
The plans establish the correct technical stack and directory structure but fail on critical cleanup and synchronization with research. Specifically, the plans do not address the removal of legacy Firebase/Provider files which will cause immediate compilation errors after Task 1. Furthermore, identified research gaps (Wave 0 tests) are ignored.

## Issues

### Blockers (must fix)

**1. [Dimension 1: Requirement Coverage] Legacy File Conflict**
- **Plan:** 01-02, 01-03
- **Description:** The plans create new feature-first versions of existing models and services (e.g., `StageProgress`, `AuthService`) but do not include tasks to delete or migrate the legacy versions in `lib/models/` and `lib/services/`. 
- **Impact:** This will result in duplicate class definitions and broken imports, preventing the application from compiling.
- **Fix:** Add a cleanup task in Plan 01 or Plan 02 to remove `lib/models/`, `lib/services/`, `lib/providers/`, and `lib/screens/` as they are replaced by the `lib/features/` structure.

**2. [Dimension 11: Research Resolution] Missing Wave 0 Infrastructure Test**
- **Plan:** 01-01 or 01-02
- **Description:** RESEARCH.md explicitly identifies a Wave 0 gap: `test/infrastructure_test.dart` to verify Isar and Supabase client initialization. No plan includes a task to implement this.
- **Impact:** Failure to verify infrastructure initialization early increases risk of late-phase debugging.
- **Fix:** Add a task to create `test/infrastructure_test.dart` as a TDD or autonomous task in Plan 02.

**3. [Dimension 1: Requirement Coverage] Version Discrepancy**
- **Plan:** 01-01
- **Task:** 1
- **Description:** Plan 01-01 uses `flutter_riverpod: ^2.5.1` and `riverpod_generator: ^2.4.0`, while RESEARCH.md specifies `3.3.1` and `3.0.0` respectively.
- **Impact:** Contradicts the "Standard Stack" defined in research.
- **Fix:** Align `pubspec.yaml` versions with RESEARCH.md or update research if 3.x is not yet stable/available.

### Warnings (should fix)

**1. [Dimension 1: Requirement Coverage] Incomplete Firebase Removal**
- **Plan:** 01-03
- **Description:** While `pubspec.yaml` is updated, there is no explicit task to remove `lib/firebase_options.dart` or the `firebase_options.dart` in the root.
- **Fix:** Add a cleanup task to remove Firebase-specific configuration files.

**2. [Dimension 1: Requirement Coverage] Missing Main cleanup**
- **Plan:** 01-03
- **Task:** 3
- **Description:** Task 3 mentions initializing Supabase and Isar but doesn't explicitly mention removing the legacy Firebase initialization call from `main.dart`.
- **Fix:** Explicitly state "Remove Firebase.initializeApp" in the action.

## Structured Issues

```yaml
issues:
  - plan: "01-01"
    dimension: "research_resolution"
    severity: "blocker"
    description: "Wave 0 gap 'test/infrastructure_test.dart' from RESEARCH.md is not addressed."
    fix_hint: "Add a task to create the infrastructure test file."

  - plan: "01-01"
    dimension: "requirement_coverage"
    severity: "blocker"
    description: "Riverpod versions in Plan 01-01 (2.5.1) contradict RESEARCH.md (3.3.1)."
    fix_hint: "Sync versions with RESEARCH.md."

  - plan: "01-02"
    dimension: "requirement_coverage"
    severity: "blocker"
    description: "No task to delete legacy 'lib/models/stage_progress.dart' which conflicts with the new feature-first version."
    fix_hint: "Add cleanup tasks for lib/models/, lib/services/, etc."

  - plan: "01-03"
    dimension: "requirement_coverage"
    severity: "warning"
    description: "Legacy Firebase configuration files (firebase_options.dart) are not removed."
    fix_hint: "Add task to delete firebase_options.dart."
```

## Recommendation
Return to planning phase to address cleanup and research alignment. The project will be in a non-compilable state after the first task of Plan 01 without these fixes.

