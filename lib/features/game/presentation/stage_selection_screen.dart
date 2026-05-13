import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/neon_theme.dart';
import '../providers/progression_controller.dart';
import '../providers/game_controller.dart';

class StageSelectionScreen extends ConsumerWidget {
  const StageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stagesAsync = ref.watch(progressionControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
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
                          'CAMPAIGN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18, 
                            fontWeight: FontWeight.bold, 
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ).animate().fadeIn().scale(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                Expanded(
                  child: stagesAsync.when(
                    data: (stages) => GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(24),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: stages.length,
                      itemBuilder: (context, index) {
                        final stage = stages[index];
                        final isUnlocked = stage.isUnlocked;

                        return _StageCard(
                          stageNumber: stage.stageNumber,
                          stars: stage.stars,
                          isUnlocked: isUnlocked,
                          onTap: isUnlocked
                              ? () {
                                  final difficulty = stage.stageNumber <= 15
                                      ? 'easy'
                                      : (stage.stageNumber <= 30 ? 'normal' : 'impossible');
                                  ref.read(gameControllerProvider.notifier).setDifficulty(difficulty);
                                  context.push('/game/offline');
                                }
                              : null,
                        ).animate().fadeIn(delay: Duration(milliseconds: 200 + (index * 30))).scale();
                      },
                    ),
                    loading: () => const Center(child: CircularProgressIndicator(color: NeonColors.primary)),
                    error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
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

class _StageCard extends StatefulWidget {
  final int stageNumber;
  final int stars;
  final bool isUnlocked;
  final VoidCallback? onTap;

  const _StageCard({
    required this.stageNumber,
    required this.stars,
    required this.isUnlocked,
    this.onTap,
  });

  @override
  State<_StageCard> createState() => _StageCardState();
}

class _StageCardState extends State<_StageCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.isUnlocked ? (_) => setState(() => _isHovering = true) : null,
      onTapUp: widget.isUnlocked ? (_) {
        setState(() => _isHovering = false);
        widget.onTap?.call();
      } : null,
      onTapCancel: widget.isUnlocked ? () => setState(() => _isHovering = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovering ? 4 : (widget.isUnlocked ? -2 : 0), 0),
        decoration: BoxDecoration(
          color: widget.isUnlocked 
              ? NeonColors.primary.withValues(alpha: 0.1) 
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isUnlocked ? NeonColors.primary.withValues(alpha: 0.5) : Colors.white10,
            width: 1,
          ),
          boxShadow: widget.isUnlocked && !_isHovering
              ? [BoxShadow(color: NeonColors.primary.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.isUnlocked)
              Text(
                '${widget.stageNumber}',
                style: const TextStyle(
                  color: NeonColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: NeonColors.primary, blurRadius: 10)],
                ),
              )
            else
              const Icon(Icons.lock, color: Colors.white24, size: 24),
            
            if (widget.isUnlocked) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i) {
                  return Icon(
                    i < widget.stars ? Icons.star : Icons.star_border,
                    color: i < widget.stars ? Colors.amber : Colors.white24,
                    size: 10,
                  );
                }),
              ),
            ],
          ],
        ),
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