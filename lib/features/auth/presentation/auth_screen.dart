import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/neon_theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [NeonColors.backgroundDark, Color(0xFF0C2227)],
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
                          'SYSTEM ACCESS',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ).animate().fadeIn().scale(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lock_outline,
                            size: 64,
                            color: NeonColors.primary,
                          ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scaleXY(begin: 0.9, end: 1.1, duration: 1.seconds),
                          
                          const SizedBox(height: 16),
                          
                          const Text(
                            'AUTHENTICATION REQUIRED',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ).animate().fadeIn(delay: 200.ms),
                          
                          const SizedBox(height: 48),
                          
                          Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: NeonColors.primary.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: NeonColors.primary.withValues(alpha: 0.3), width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: NeonColors.primary.withValues(alpha: 0.1),
                                  blurRadius: 30,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'ACCESS ID (EMAIL)',
                                    labelStyle: const TextStyle(color: Colors.white54, letterSpacing: 1),
                                    prefixIcon: const Icon(Icons.badge, color: NeonColors.primary),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2))),
                                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: NeonColors.primary)),
                                  ),
                                ).animate().fadeIn(delay: 400.ms).slideX(),
                                
                                const SizedBox(height: 24),
                                
                                TextField(
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'SECURITY KEY (PASSWORD)',
                                    labelStyle: const TextStyle(color: Colors.white54, letterSpacing: 1),
                                    prefixIcon: const Icon(Icons.password, color: NeonColors.primary),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2))),
                                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: NeonColors.primary)),
                                  ),
                                ).animate().fadeIn(delay: 500.ms).slideX(),
                                
                                const SizedBox(height: 48),
                                
                                _AnimatedButton(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Authentication bypassed in Offline Mode.'),
                                        backgroundColor: NeonColors.primary,
                                      ),
                                    );
                                    context.pop();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: NeonColors.primary,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: NeonColors.primary.withValues(alpha: 0.4),
                                          blurRadius: 15,
                                          offset: const Offset(0, 5),
                                        )
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'ENTER GRID',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.5),
                              ],
                            ),
                          ).animate().fadeIn(delay: 300.ms).scale(),
                        ],
                      ),
                    ),
                  ),
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