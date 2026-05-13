import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/neon_theme.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Wait for the animation to play out and any potential initialization
    await Future.delayed(const Duration(milliseconds: 3500));
    if (mounted) {
      context.go('/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeonColors.backgroundDark,
      body: Stack(
        children: [
          // Background Gradient Glow
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.5,
                  colors: [
                    Color(0x3300E5FF),
                    NeonColors.backgroundDark,
                  ],
                ),
              ),
            ),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true)).fadeIn(duration: 1.seconds).scaleXY(begin: 0.9, end: 1.1, duration: 3.seconds),
          
          // Floating Particles
          ...List.generate(5, (index) {
            return Positioned(
              left: 50.0 + (index * 60),
              top: 100.0 + (index * 120) % 300,
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: NeonColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: NeonColors.primary, blurRadius: 10, spreadRadius: 2),
                  ],
                ),
              ).animate(onPlay: (controller) => controller.repeat(reverse: true))
               .fadeIn(delay: (index * 200).ms)
               .moveY(begin: 20, end: -20, duration: (1000 + index * 500).ms, curve: Curves.easeInOutSine),
            );
          }),

          // Center Logo and Loading Text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Game Symbol
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Glow effect
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: NeonColors.primary.withValues(alpha: 0.3),
                            blurRadius: 40,
                            spreadRadius: 10,
                          )
                        ],
                      ),
                    ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scaleXY(begin: 0.8, end: 1.2, duration: 1.5.seconds),
                    
                    // Tic Tac Toe Grid Icon
                    const Icon(
                      Icons.grid_3x3_rounded,
                      size: 80,
                      color: NeonColors.primary,
                    )
                    .animate()
                    .scale(duration: 800.ms, curve: Curves.easeOutBack)
                    .then()
                    .shake(duration: 500.ms),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // App Title
                const Text(
                  'NEON GRID',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 8,
                    shadows: [
                      Shadow(color: NeonColors.primary, blurRadius: 15)
                    ]
                  ),
                )
                .animate()
                .fadeIn(delay: 600.ms, duration: 800.ms)
                .slideY(begin: 0.5, end: 0, duration: 800.ms, curve: Curves.easeOut),
                
                const SizedBox(height: 20),
                
                // Loading indicator
                Container(
                  width: 150,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 150,
                      height: 2,
                      decoration: BoxDecoration(
                        color: NeonColors.primary,
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: const [
                          BoxShadow(color: NeonColors.primary, blurRadius: 5),
                        ]
                      ),
                    ).animate().scaleX(begin: 0, end: 1, duration: 2.5.seconds, alignment: Alignment.centerLeft),
                  ),
                ).animate().fadeIn(delay: 1.seconds),
                
                const SizedBox(height: 16),
                const Text(
                  'INITIALIZING SYSTEM...',
                  style: TextStyle(
                    color: NeonColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat(reverse: true))
                .fadeIn(delay: 1.2.seconds)
                .fadeOut(delay: 2.seconds),
              ],
            ),
          ),
        ],
      ),
    );
  }
}