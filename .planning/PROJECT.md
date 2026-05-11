# Project: Neon Tic-Tac-Toe (Pro)

## Vision
A professional-grade, cross-platform Tic-Tac-Toe game built with Flutter and Supabase. It features a deep offline progression system with perfect-play AI and a real-time multiplayer experience with a neon/dark-mode aesthetic.

## Core Objectives
1. **Infrastructure Upgrade**: Transition from Firebase/Provider to Supabase/Riverpod.
2. **Offline Progression**: 3 tiers (Easy, Normal, Impossible) x 15 stages each, with sequential unlocks.
3. **Perfect AI**: Implementation of the Minimax algorithm for "Impossible" difficulty.
4. **Persistence**: Robust local tracking of stars and unlocks using SQLite/Hive.
5. **High-Fidelity UI**: Neon aesthetic with pulsing animations and gradient effects.
6. **Real-time Multiplayer**: Matchmaking and board synchronization via Supabase Realtime.

## Tech Stack
- **Frontend**: Flutter (Dart)
- **State Management**: Riverpod
- **Backend/Realtime**: Supabase (Auth, DB, Realtime)
- **Local Database**: SQLite (sqflite) or Hive
- **UI/UX**: Material 3, Custom Neon Theme, Google Fonts

## Target Platforms
- Android
- iOS
- Web
