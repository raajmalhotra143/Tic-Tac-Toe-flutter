# Roadmap: Neon Tic-Tac-Toe (Pro)

## Phase 1: Foundation & Infrastructure
- [ ] Initialize Supabase project and database schema.
- [ ] Set up Riverpod for state management.
- [ ] Implement local database (SQLite/Hive) for progression tracking.
- [ ] Scaffold project structure following `lib/features/`.

## Phase 2: Offline Core & AI
- [ ] Implement core Tic-Tac-Toe logic engine.
- [ ] Develop AI difficulties:
  - [ ] Easy (Random)
  - [ ] Normal (Heuristic)
  - [ ] Impossible (Minimax)
- [ ] Create the 3-Tier/45-Stage progression system.
- [ ] Implement sequential stage unlocking logic.

## Phase 3: Neon UI & UX
- [ ] Design and implement the Neon/Dark-mode theme.
- [ ] Add pulsing animations and glow effects.
- [ ] Build screens: Welcome, Stage Selection, Game Screen, Result Overlays.
- [ ] Implement star-rating feedback animations.

## Phase 4: Online Multiplayer
- [ ] Implement Supabase Auth (Anonymous & Email).
- [ ] Develop real-time matchmaking system.
- [ ] Integrate Supabase Realtime for board synchronization.
- [ ] Add basic player profiles and online leaderboards.

## Phase 5: Polish & Deployment
- [ ] Fix "stage jumping" and other edge cases.
- [ ] Performance optimization for low-end devices.
- [ ] Final testing across Android, iOS, and Web.
- [ ] Deploy web version to Firebase Hosting or Vercel.
