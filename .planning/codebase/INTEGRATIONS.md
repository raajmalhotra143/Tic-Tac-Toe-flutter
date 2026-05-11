# External Integrations

**Analysis Date:** 2025-02-12

## APIs & External Services

**Firebase Services:**
- Firebase Auth - Handles user sign-in/up (Email/Password).
  - SDK: `firebase_auth`
  - Auth: Configuration in `lib/firebase_options.dart`
- Cloud Firestore - Real-time document storage for matchmaking and live match state.
  - SDK: `cloud_firestore`
- Firebase Core - Essential bootstrap for all Firebase services.
  - SDK: `firebase_core`

## Data Storage

**Databases:**
- Cloud Firestore (NoSQL)
  - Connection: Managed via `Firebase.initializeApp()`
  - Client: `FirebaseFirestore.instance` in `lib/services/matchmaking_service.dart`

**File Storage:**
- Local filesystem only (via `shared_preferences` for progress and settings). `lib/services/local_storage_service.dart`

**Caching:**
- Firestore Offline Persistence - Enabled by default in Flutter SDK for mobile/web.

## Authentication & Identity

**Auth Provider:**
- Firebase Authentication
  - Implementation: Email/Password login. `lib/services/auth_service.dart`

## Monitoring & Observability

**Error Tracking:**
- Not detected (Firebase Crashlytics is a likely future addition).

**Logs:**
- Console Logging - Standard `debugPrint` or `print` used for development.

## CI/CD & Deployment

**Hosting:**
- Firebase Hosting (Configured in `firebase.json`)

**CI Pipeline:**
- Not detected (Project prepared for GitHub Actions via Firebase CLI).

## Environment Configuration

**Required env vars:**
- None detected; configuration is baked into `lib/firebase_options.dart` and `google-services.json`.

**Secrets location:**
- Firebase API Keys - Stored in `lib/firebase_options.dart` (Note: These are public API keys, not administrative secrets).

## Webhooks & Callbacks

**Incoming:**
- None

**Outgoing:**
- None

---

*Integration audit: 2025-02-12*
