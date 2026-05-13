import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/welcome/presentation/welcome_screen.dart';
import '../../features/welcome/presentation/animated_splash_screen.dart';
import '../../features/game/presentation/mode_selection_screen.dart';
import '../../features/game/presentation/stage_selection_screen.dart';
import '../../features/game/presentation/offline_game_screen.dart';
import '../../features/game/presentation/emoji_selection_screen.dart';
import '../../features/auth/presentation/auth_screen.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            ),
          ),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const AnimatedSplashScreen(),
      ),
    ),
    GoRoute(
      path: '/welcome',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const WelcomeScreen(),
      ),
    ),
    GoRoute(
      path: '/modes',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const ModeSelectionScreen(),
      ),
    ),
    GoRoute(
      path: '/stages',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const StageSelectionScreen(),
      ),
    ),
    GoRoute(
      path: '/game/offline',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const OfflineGameScreen(),
      ),
    ),
    GoRoute(
      path: '/emoji-selection',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const EmojiSelectionScreen(),
      ),
    ),
    GoRoute(
      path: '/auth',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const AuthScreen(),
      ),
    ),
  ],
);
