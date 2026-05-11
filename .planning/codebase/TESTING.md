# Testing Patterns

**Analysis Date:** 2025-02-13

## Test Framework

**Runner:**
- Flutter Test (Dart Test)
- Executable: `flutter test`

**Assertion Library:**
- `package:flutter_test/flutter_test.dart` (Matchers)

**Run Commands:**
```bash
flutter test              # Run all tests
flutter test --watch      # Watch mode (if supported by environment)
flutter test --coverage   # Coverage
```

## Test File Organization

**Location:**
- Separate directory: `test/`

**Naming:**
- `*_test.dart` (e.g., `test/widget_test.dart`)

**Structure:**
```
test/
└── widget_test.dart
```

## Test Structure

**Suite Organization:**
```typescript
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('App smoke test', (tester) async {
    // Test logic here
    expect(TicTacToeApp, isNotNull);
  });
}
```

**Patterns:**
- `testWidgets` for widget tests.
- `test` for unit tests (prescribed in `GEMINI.md`, though few exist currently).

## Mocking

**Framework:** `mockito` or `mocktail` (prescribed in `GEMINI.md`, though not yet in `pubspec.yaml`).

**Patterns:**
- AI guidelines suggest setting up mocking to isolate units under test from their dependencies.

**What to Mock:**
- External services (Firebase, Local Storage).
- Network requests.

**What NOT to Mock:**
- Value objects and simple data models.

## Fixtures and Factories

**Test Data:**
- Simple model instantiation in tests is the current pattern (though usage is minimal).

**Location:**
- No dedicated fixtures directory detected yet.

## Coverage

**Requirements:** None enforced.

**View Coverage:**
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## Test Types

**Unit Tests:**
- Recommended for business logic in `lib/services/` and `lib/models/`.

**Integration Tests:**
- None detected in `integration_test/`.

**E2E Tests:**
- Not used.

## Common Patterns

**Async Testing:**
- Use `await tester.pumpWidget(...)` and `await tester.pumpAndSettle()` for widget tests.

**Error Testing:**
- Use `expect(..., throwsA(...))` or `expect(..., throwsException)`.

---

*Testing analysis: 2025-02-13*
