import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/neon_theme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [NeonColors.deepCharcoal, Color(0xFF1A1A1A)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NEON\nGRID',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                shadows: [
                  Shadow(
                    color: NeonColors.neonCyan.withValues(alpha: 0.8),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'THE ULTIMATE TIC-TAC-TOE',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: NeonColors.neonMagenta,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 80),
            ScaleTransition(
              scale: _animation,
              child: GestureDetector(
                onTap: () => context.go('/modes'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  decoration: NeonEffects.neonBox(color: NeonColors.neonCyan),
                  child: Text(
                    'PLAY',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 24,
                      color: NeonColors.neonCyan,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
