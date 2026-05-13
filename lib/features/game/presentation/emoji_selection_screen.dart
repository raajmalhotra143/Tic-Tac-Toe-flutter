import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/neon_theme.dart';
import '../providers/game_controller.dart';

class EmojiSelectionScreen extends ConsumerStatefulWidget {
  const EmojiSelectionScreen({super.key});

  @override
  ConsumerState<EmojiSelectionScreen> createState() => _EmojiSelectionScreenState();
}

class _EmojiSelectionScreenState extends ConsumerState<EmojiSelectionScreen> {
  late String selectedEmoji;
  final List<String> emojis = ['😀', '😎', '🤖', '👻', '🐱', '🐸', '🔥', '⭐'];

  @override
  void initState() {
    super.initState();
    selectedEmoji = ref.read(gameControllerProvider).playerXEmoji;
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
                      const Expanded(
                        child: Text(
                          'CUSTOMIZE',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ).animate().fadeIn().scale(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Choose Your Piece',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
                        const SizedBox(height: 12),
                        const Text(
                          "Select the emoji you want to play as.\nThe classic 'X' just got an upgrade.",
                          style: TextStyle(color: Colors.white54, fontSize: 16, height: 1.5),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(delay: 300.ms),
                        const SizedBox(height: 40),

                        // Emoji Grid
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: emojis.length,
                          itemBuilder: (context, index) {
                            final emoji = emojis[index];
                            final isSelected = selectedEmoji == emoji;
                            return _EmojiCard(
                              emoji: emoji,
                              isSelected: isSelected,
                              onTap: () => setState(() => selectedEmoji = emoji),
                            ).animate().fadeIn(delay: Duration(milliseconds: 400 + (index * 50))).scale();
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Confirm Action
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.white10)),
                    color: Color(0xCC0A161E),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _AnimatedButton(
                        onTap: () {
                          ref.read(gameControllerProvider.notifier).setPlayerEmoji(selectedEmoji);
                          context.push('/game/offline');
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
                              'CONFIRM SELECTION',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1),
                            ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.5),
                      const SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.white54, fontSize: 12),
                          children: [
                            const TextSpan(text: 'Playing against: '),
                            TextSpan(
                              text: ref.read(gameControllerProvider).playerOEmoji,
                              style: const TextStyle(color: NeonColors.primary, fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(text: ' (AI Robot)'),
                          ],
                        ),
                      ).animate().fadeIn(delay: 900.ms),
                    ],
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

class _EmojiCard extends StatefulWidget {
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  const _EmojiCard({required this.emoji, required this.isSelected, required this.onTap});

  @override
  State<_EmojiCard> createState() => _EmojiCardState();
}

class _EmojiCardState extends State<_EmojiCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isHovering = true),
      onTapUp: (_) {
        setState(() => _isHovering = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovering ? 4 : (widget.isSelected ? -4 : 0), 0),
        decoration: BoxDecoration(
          color: widget.isSelected ? NeonColors.primary.withValues(alpha: 0.15) : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: widget.isSelected ? NeonColors.primary : Colors.white10,
            width: widget.isSelected ? 2 : 1,
          ),
          boxShadow: widget.isSelected
              ? [BoxShadow(color: NeonColors.primary.withValues(alpha: 0.4), blurRadius: 15, spreadRadius: 2)]
              : (_isHovering ? [] : [const BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.emoji,
              style: TextStyle(
                fontSize: 48,
                shadows: widget.isSelected ? [const Shadow(color: NeonColors.primary, blurRadius: 15)] : [],
              ),
            ),
            if (widget.isSelected) ...[
              const SizedBox(height: 8),
              const Text(
                'SELECTED',
                style: TextStyle(
                  color: NeonColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ).animate().fadeIn(),
            ],
          ],
        ),
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