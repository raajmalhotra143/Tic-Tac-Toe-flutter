# Requirements: Neon Tic-Tac-Toe (Pro)

## 1. Functional Requirements

### 1.1 Offline Game Modes
- **Easy Mode**: AI makes random moves.
- **Normal Mode**: AI uses heuristics to block immediate wins and take immediate wins.
- **Impossible Mode**: AI uses the Minimax algorithm. Stage 15 is hard-coded/configured to be mathematically unwinnable (AI will always win or draw at best, but the user's goal is to see it "never lose").

### 1.2 Progression System
- **Tiers**: 3 Tiers (Easy, Normal, Impossible).
- **Stages**: 15 stages per tier (45 total).
- **Sequential Unlock**: Stages must be unlocked one by one. Stage `n+1` only unlocks if Stage `n` is completed.
- **Star Rating**:
  - 3 Stars: Win in 3 moves (for X) or optimal minimum moves.
  - 2 Stars: Win in 4 moves.
  - 1 Star: Win in 5+ moves.
- **Persistence**: Local database (SQLite or Hive) to store stage progress, stars, and unlock status.

### 1.3 Online Multiplayer
- **Matchmaking**: Real-time queueing system using Supabase.
- **Real-time Sync**: Board updates and turn indicators synced via Supabase Realtime.
- **Authentication**: Email/Password and Anonymous login via Supabase Auth.

### 1.4 UI/UX
- **Aesthetic**: Neon/Dark-mode theme.
- **Effects**: Pulsing animations, gradient text, glowing buttons.
- **Components**: Emoji-based player markers (customizable).

## 2. Technical Requirements

### 2.1 Frontend
- **Framework**: Flutter.
- **State Management**: Riverpod.
- **Architecture**: Feature-first structure (`lib/features/`).

### 2.2 Backend
- **Platform**: Supabase.
- **Database**: PostgreSQL (Public schema).
- **Realtime**: Supabase Channels for game state.
- **Matchmaking**: Postgres RPC with `SKIP LOCKED`.

### 2.3 AI Implementation
- **Algorithm**: Minimax with alpha-beta pruning (if needed for performance, though 3x3 is small).
- **Perfect Play**: Guaranteed draw or win for AI in Impossible mode.

## 3. Constraints & Non-Functional
- **Zero Drift**: No "stage jumping" bugs.
- **Performance**: High frame rate (60fps+) for animations.
- **Responsiveness**: Support for Mobile (Android/iOS) and Web.
