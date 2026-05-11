import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/neon_theme.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: TicTacToeApp(),
    ),
  );
}

class TicTacToeApp extends ConsumerWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Neon Grid – Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: NeonTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
