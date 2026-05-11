import 'package:go_router/go_router.dart';
import '../../features/welcome/presentation/welcome_screen.dart';
import '../../features/game/presentation/mode_selection_screen.dart';
import '../../features/game/presentation/stage_selection_screen.dart';
import '../../features/game/presentation/offline_game_screen.dart';
import '../../features/auth/presentation/auth_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
    GoRoute(
      path: '/modes',
      builder: (context, state) => const ModeSelectionScreen(),
    ),
    GoRoute(
      path: '/stages',
      builder: (context, state) => const StageSelectionScreen(),
    ),
    GoRoute(
      path: '/game/offline',
      builder: (context, state) => const OfflineGameScreen(),
    ),
    GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
  ],
);
