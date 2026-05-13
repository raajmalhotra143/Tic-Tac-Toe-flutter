import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';
import 'core/theme/neon_theme.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    debugPrint('Firebase already initialized or failed: $e');
  }

  // Initialize Google Sign In (Required in 7.x)
  await GoogleSignIn.instance.initialize();

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
