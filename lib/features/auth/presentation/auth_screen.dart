import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/neon_theme.dart';
import '../services/auth_service.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleAuth() async {
    setState(() => _isLoading = true);
    final authService = ref.read(authServiceProvider);
    
    final result = _isLogin 
      ? await authService.signInWithEmail(_emailController.text, _passwordController.text)
      : await authService.registerWithEmail(_emailController.text, _passwordController.text);

    setState(() => _isLoading = false);

    if (result != null) {
      if (mounted) context.go('/modes');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isLogin ? 'Login Failed' : 'Registration Failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);
    final result = await ref.read(authServiceProvider).signInWithGoogle();
    setState(() => _isLoading = false);

    if (result != null) {
      if (mounted) context.go('/modes');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Google Sign-In Failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

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
                      Expanded(
                        child: Text(
                          _isLogin ? 'SYSTEM ACCESS' : 'NEW REGISTRATION',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
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
                          
                          Text(
                            _isLogin ? 'AUTHENTICATION REQUIRED' : 'CREATE GRID IDENTITY',
                            style: const TextStyle(
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
                                  controller: _emailController,
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
                                  controller: _passwordController,
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
                                
                                if (_isLoading)
                                  const CircularProgressIndicator(color: NeonColors.primary)
                                else ...[
                                  _AnimatedButton(
                                    onTap: _handleAuth,
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
                                      child: Center(
                                        child: Text(
                                          _isLogin ? 'ENTER GRID' : 'INITIALIZE ID',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.5),
                                  
                                  const SizedBox(height: 24),
                                  
                                  const Row(
                                    children: [
                                      Expanded(child: Divider(color: Colors.white10)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: Text('OR', style: TextStyle(color: Colors.white24, fontSize: 12)),
                                      ),
                                      Expanded(child: Divider(color: Colors.white10)),
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 24),
                                  
                                  _AnimatedButton(
                                    onTap: _handleGoogleSignIn,
                                    child: Container(
                                      width: double.infinity,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            'https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg',
                                            height: 24,
                                          ),
                                          const SizedBox(width: 12),
                                          const Text(
                                            'GOOGLE ACCESS',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.5),
                                  
                                  const SizedBox(height: 24),
                                  
                                  TextButton(
                                    onPressed: () => setState(() => _isLogin = !_isLogin),
                                    child: Text(
                                      _isLogin ? 'REQUEST NEW ID' : 'ALREADY HAVE ACCESS ID',
                                      style: const TextStyle(color: NeonColors.primary, letterSpacing: 1, fontSize: 12),
                                    ),
                                  ),
                                ],
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