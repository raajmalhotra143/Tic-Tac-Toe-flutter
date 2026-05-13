import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/neon_theme.dart';

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  NeonColors.backgroundDark,
                  Color(0xFF0C2227),
                  NeonColors.backgroundDark,
                ],
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      _AnimatedIconButton(
                        icon: Icons.arrow_back,
                        onTap: () => context.pop(),
                      ).animate().fadeIn().slideX(),
                      const Expanded(
                        child: Text(
                          'GAME MODES',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ).animate().fadeIn().scale(),
                      const SizedBox(width: 48), // Spacer for centering
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            children: const [
                              TextSpan(text: 'Select '),
                              TextSpan(
                                text: 'Battlefield',
                                style: TextStyle(
                                  color: NeonColors.primary,
                                  shadows: [Shadow(color: NeonColors.primary, blurRadius: 15)],
                                ),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
                        const SizedBox(height: 8),
                        const Text(
                          'Choose how you want to play',
                          style: TextStyle(color: Colors.white60, fontSize: 16, fontWeight: FontWeight.w500),
                        ).animate().fadeIn(delay: 300.ms),
                        const SizedBox(height: 40),

                        // Offline Mode Card
                        _buildModeCard(
                          context: context,
                          title: 'Offline AI',
                          description: 'Perfect your strategy against our advanced AI or challenge a friend locally.',
                          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC1OLFHSSPJ3P4CjTQ7m_HmjJipCyT4ZQZ2qhiBKw3x1Nood-tU4qNdKCETEfBWropq3zloUMpekUJmW3vub-aoxeDLGzNDyxF83zFsaIMqjkWLj7yfVTy1wOTE4DscY143fvtmbdlmcrjnUAqFBiiMnzrviEA0RA74P_Pq5EzFn-HVefh-bD5irmKDL0P2mUTfDKi3IgGpgvvFfVN-gFcUi2zvnWLTYdxiLRdp3ipd6T04ypJgHaIn8sCvve0i4T4rMfDe3Pyg8wUU',
                          badge: 'SOLO / LOCAL',
                          actionLabel: 'PLAY OFFLINE',
                          icon: Icons.smart_toy,
                          onTap: () => context.push('/stages'),
                        ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2),

                        const SizedBox(height: 32),

                        // Online Mode Card
                        _buildOnlineCard(context).animate().fadeIn(delay: 600.ms).slideX(begin: 0.2),

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
                      decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.white10)),
                        color: Color(0x800A161E),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _NavIcon(icon: Icons.home, label: 'Home', onTap: () => context.go('/')),
                          _NavIcon(icon: Icons.sports_esports, label: 'Modes', isActive: true, onTap: () {}),
                          _NavIcon(icon: Icons.person, label: 'Profile', onTap: () {}),
                          _NavIcon(icon: Icons.settings, label: 'Settings', onTap: () => context.push('/auth')),
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

  Widget _buildModeCard({
    required BuildContext context,
    required String title,
    required String description,
    required String imageUrl,
    required String badge,
    required String actionLabel,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return _AnimatedButton(
      onTap: onTap,
      child: Container(
        decoration: NeonEffects.glassPanel(borderRadius: 24).copyWith(
          boxShadow: [
            BoxShadow(
              color: NeonColors.primary.withValues(alpha: 0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: Colors.black.withValues(alpha: 0.4),
                  colorBlendMode: BlendMode.darken,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: NeonColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: NeonColors.primary.withValues(alpha: 0.5)),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: NeonColors.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white60, fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: NeonColors.primary,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: NeonColors.primary.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 5))
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, color: Colors.black, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          actionLabel,
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnlineCard(BuildContext context) {
    return Container(
      decoration: NeonEffects.glassPanel(borderRadius: 24).copyWith(
        border: Border.all(color: Colors.white10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCCZxb8ESLYs-WzP47j0cCUy7OmmKUuJ2NJBcLidops1hPqVzK8Ll06uEKNGQElqWUF5XSApl4snCBxrATJBmebcku5CRuCX3ESzfOl4rrHsmaUena2pSo7TPMnbRGYxTqxzaI3Nr-l8lX6o2OKCtRX1or0dsNi8YOCgQ0Q-ki_175CyFoIqvRFSBgYxUZo2ojw1hC9EWzFsrhSuYUXDhX5uwoUtsrhRFcHaw8ggVyphGxdmufmN3VmidQ42TNWEiw1SzU2038iZPTv',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                color: Colors.black.withValues(alpha: 0.5),
                colorBlendMode: BlendMode.darken,
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Text(
                    'MULTIPLAYER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Global Arena',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              shape: BoxShape.circle,
                            ),
                          ).animate(onPlay: (controller) => controller.repeat(reverse: true)).fadeOut(),
                          const SizedBox(width: 6),
                          const Text(
                            '1,240 Online',
                            style: TextStyle(color: Colors.greenAccent, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Compete with grandmasters worldwide. Climb the leaderboard and earn rewards.',
                  style: TextStyle(color: Colors.white54, fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: _AnimatedButton(
                        onTap: () => context.push('/auth'),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(color: NeonColors.primary),
                            borderRadius: BorderRadius.circular(16),
                            color: NeonColors.primary.withValues(alpha: 0.1),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.login, color: NeonColors.primary, size: 20),
                              SizedBox(width: 8),
                              Text('LOGIN', style: TextStyle(color: NeonColors.primary, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _AnimatedButton(
                        onTap: () => context.push('/auth'),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white24),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withValues(alpha: 0.05),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_add, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text('REGISTER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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

class _AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _AnimatedIconButton({required this.icon, required this.onTap});

  @override
  State<_AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<_AnimatedIconButton> {
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
        scale: _isPressed ? 0.9 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white10),
          ),
          child: Icon(widget.icon, color: Colors.white, size: 24),
        ),
      ),
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