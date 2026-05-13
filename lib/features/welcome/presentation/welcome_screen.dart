import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/neon_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Decorative Glows
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NeonColors.primary.withValues(alpha: 0.15),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: const SizedBox(),
              ),
            ),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scaleXY(begin: 0.9, end: 1.1, duration: 4.seconds),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withValues(alpha: 0.1),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: const SizedBox(),
              ),
            ),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scaleXY(begin: 0.9, end: 1.1, duration: 3.seconds),

          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: NeonColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: NeonColors.primary.withValues(alpha: 0.3)),
                        ),
                        child: const Icon(Icons.videogame_asset, color: NeonColors.primary, size: 30),
                      ).animate().fadeIn().slideX(),
                      const Expanded(
                        child: Text(
                          'NEON GRID',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            shadows: [Shadow(color: NeonColors.primary, blurRadius: 10)],
                          ),
                        ),
                      ).animate().fadeIn().scale(),
                      GestureDetector(
                        onTap: () => context.push('/auth'),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: NeonColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: NeonColors.primary.withValues(alpha: 0.3)),
                          ),
                          child: const Icon(Icons.settings, color: NeonColors.primary),
                        ),
                      ).animate().fadeIn().slideX(begin: 0.5),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Hero Grid Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              padding: const EdgeInsets.all(32),
                              decoration: NeonEffects.glassPanel(borderRadius: 24).copyWith(
                                boxShadow: [
                                  BoxShadow(
                                    color: NeonColors.primary.withValues(alpha: 0.2),
                                    blurRadius: 40,
                                  ),
                                ],
                              ),
                              child: GridView.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  _buildGridItem(Icons.close, true, true, true),
                                  _buildGridItem(null, false, true, true),
                                  _buildGridItem(Icons.circle_outlined, false, true, false),
                                  _buildGridItem(null, false, true, true),
                                  _buildGridItem(Icons.close, true, true, true),
                                  _buildGridItem(null, false, true, false),
                                  _buildGridItem(Icons.circle_outlined, false, false, true),
                                  _buildGridItem(null, false, false, true),
                                  _buildGridItem(Icons.close, true, false, false),
                                ],
                              ),
                            ),
                          ),
                        ).animate().fadeIn(delay: 200.ms).scale(curve: Curves.easeOutBack),

                        const SizedBox(height: 48),

                        // Title & Description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    height: 1.1,
                                    color: Colors.white,
                                  ),
                                  children: const [
                                    TextSpan(text: 'The Ultimate\n'),
                                    TextSpan(
                                      text: 'Challenge',
                                      style: TextStyle(
                                        color: NeonColors.primary,
                                        shadows: [
                                          Shadow(
                                            color: NeonColors.primary,
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
                              const SizedBox(height: 16),
                              Text(
                                'Experience the classic game with a modern neon twist. Play against global players or master the AI.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  height: 1.5,
                                ),
                              ).animate().fadeIn(delay: 600.ms),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Action Buttons
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              _AnimatedButton(
                                onTap: () => context.go('/modes'),
                                child: Container(
                                  width: double.infinity,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: NeonColors.primary,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: NeonColors.primary.withValues(alpha: 0.4),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow, size: 28, color: Colors.black),
                                      SizedBox(width: 8),
                                      Text(
                                        'PLAY NOW',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.5),
                              
                              const SizedBox(height: 16),
                              
                              _AnimatedButton(
                                onTap: () => context.go('/modes'),
                                child: Container(
                                  width: double.infinity,
                                  height: 64,
                                  decoration: NeonEffects.glassPanel(borderRadius: 16),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.group, color: Colors.white),
                                      SizedBox(width: 8),
                                      Text(
                                        'MULTIPLAYER',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.5),
                            ],
                          ),
                        ),

                        const SizedBox(height: 60),

                        // Stats Bar
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          decoration: NeonEffects.glassPanel(borderRadius: 100),
                          child: const IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _StatItem(label: 'Online', value: '1.2k', valueColor: NeonColors.primary),
                                VerticalDivider(color: Colors.white12, thickness: 1, indent: 4, endIndent: 4, width: 32),
                                _StatItem(label: 'Matches', value: '450k+'),
                                VerticalDivider(color: Colors.white12, thickness: 1, indent: 4, endIndent: 4, width: 32),
                                _StatItem(label: 'Rating', value: '4.9/5'),
                              ],
                            ),
                          ),
                        ).animate().fadeIn(delay: 1200.ms),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),

                // Bottom Navigation
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 24, top: 12),
                      decoration: BoxDecoration(
                        border: const Border(top: BorderSide(color: Colors.white10)),
                        color: NeonColors.backgroundDark.withValues(alpha: 0.8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _NavIcon(icon: Icons.home, label: 'Home', isActive: true, onTap: () {}),
                          _NavIcon(icon: Icons.sports_esports, label: 'Games', onTap: () => context.go('/modes')),
                          _NavIcon(icon: Icons.leaderboard, label: 'Rank', onTap: () {}),
                          _NavIcon(icon: Icons.person, label: 'Profile', onTap: () {}),
                        ],
                      ),
                    ),
                  ),
                ).animate().slideY(begin: 1.0, duration: 500.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData? icon, bool isNeon, bool borderBottom, bool borderRight) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: borderBottom ? BorderSide(color: NeonColors.primary.withValues(alpha: 0.2), width: 2) : BorderSide.none,
          right: borderRight ? BorderSide(color: NeonColors.primary.withValues(alpha: 0.2), width: 2) : BorderSide.none,
        ),
      ),
      child: Center(
        child: icon != null
            ? Icon(
                icon,
                size: 40,
                color: isNeon ? NeonColors.primary : Colors.white24,
                shadows: isNeon
                    ? [const Shadow(color: NeonColors.primary, blurRadius: 15)]
                    : null,
              ).animate(onPlay: (controller) {
                  if (isNeon) controller.repeat(reverse: true);
                }).fade(duration: 1.seconds)
            : null,
      ),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const _AnimatedButton({required this.child, required this.onTap});

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: widget.child,
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _StatItem({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 10, color: Colors.white38, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: valueColor ?? Colors.white),
        ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavIcon({
    required this.icon,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? NeonColors.primary.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? NeonColors.primary : Colors.white38,
              size: isActive ? 28 : 24,
            ),
            const SizedBox(height: 4),
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                color: isActive ? NeonColors.primary : Colors.white38,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}