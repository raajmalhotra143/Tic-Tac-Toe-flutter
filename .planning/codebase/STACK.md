# Technology Stack

**Analysis Date:** 2025-02-12

## Languages

**Primary:**
- Dart 3.9.0 - Main application logic, UI components, and services. `pubspec.yaml`

**Secondary:**
- Kotlin - Android-specific host configuration. `android/app/src/main/kotlin/com/example/myapp/MainActivity.kt`
- HTML/CSS/JavaScript - Web-specific host configuration and build output. `web/index.html`

## Runtime

**Environment:**
- Flutter SDK - Cross-platform framework runtime.
- JDK 21 - Required for Android builds. `.idx/dev.nix`
- Node.js 22 - Required for Firebase CLI tools and management. `.idx/dev.nix`

**Package Manager:**
- Dart Pub - Dependency management for Dart/Flutter.
- Lockfile: `pubspec.lock` present.

## Frameworks

**Core:**
- Flutter - UI framework for building natively compiled applications. `pubspec.yaml`

**Testing:**
- flutter_test - Unit and widget testing framework. `pubspec.yaml`

**Build/Dev:**
- Firebase Tools - CLI for managing Firebase services. `.idx/dev.nix`
- Google Cloud SDK - Infrastructure management. `.idx/dev.nix`

## Key Dependencies

**Critical:**
- `firebase_core` ^3.13.0 - Firebase initialization. `lib/main.dart`
- `firebase_auth` ^5.5.2 - User authentication. `lib/services/auth_service.dart`
- `cloud_firestore` ^5.6.5 - Real-time database for matchmaking and gameplay. `lib/services/matchmaking_service.dart`
- `provider` ^6.1.5+1 - State management. `lib/providers/app_state.dart`
- `go_router` ^17.1.0 - Declarative routing. `lib/router/app_router.dart`

**Infrastructure:**
- `shared_preferences` ^2.5.3 - Local persistence for user settings and stage progress. `lib/services/local_storage_service.dart`

**UI & Experience:**
- `google_fonts` ^8.0.2 - Custom typography. `lib/theme/app_theme.dart`
- `confetti` ^0.8.0 - Victory celebrations. `lib/screens/game_screen.dart`
- `animated_text_kit` ^4.2.3 - Visual text effects. `lib/screens/welcome_screen.dart`

## Configuration

**Environment:**
- Firebase Options - Platform-specific Firebase configuration. `lib/firebase_options.dart`
- IDX Config - Declarative workspace configuration. `.idx/dev.nix`

**Build:**
- `pubspec.yaml` - Flutter project metadata and dependencies.
- `firebase.json` - Firebase project configuration.
- `android/build.gradle.kts` - Android build configuration.

## Platform Requirements

**Development:**
- Flutter 3.x
- Dart 3.x
- Firebase CLI

**Production:**
- Web (Firebase Hosting)
- Android (Google Play)

---

*Stack analysis: 2025-02-12*
