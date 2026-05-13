import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';
import '../../../core/theme/neon_theme.dart';
import '../logic/tic_tac_toe_logic.dart';
import '../providers/game_controller.dart';
import '../providers/progression_controller.dart';

class OfflineGameScreen extends ConsumerStatefulWidget {
  const OfflineGameScreen({super.key});

  @override
  ConsumerState<OfflineGameScreen> createState() => _OfflineGameScreenState();
}

class _OfflineGameScreenState extends ConsumerState<OfflineGameScreen> {
  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameControllerProvider);
    final gameNotifier = ref.read(gameControllerProvider.notifier);

    ref.listen(gameControllerProvider, (previous, next) {
      if ((next.winner != null || next.isDraw) && (previous?.winner == null && previous?.isDraw == false)) {
        if (next.winner == Player.x) {
          final stars = TicTacToeLogic.calculateStars(next.moves);
          ref.read(progressionControllerProvider.notifier).updateStageProgress(1, stars, next.moves);
        }
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 2.0,
                colors: [
                  Color(0x4000E5FF),
                  NeonColors.backgroundDark,
                  Color(0xFF070B0E),
                ],
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      _AnimatedIconButton(
                        icon: Icons.arrow_back,
                        onTap: () => context.pop(),
                      ).animate().fadeIn().slideX(),
                      const Expanded(
                        child: Text(
                          'TIC-TAC-NEON',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            shadows: [
                              Shadow(
                                color: NeonColors.primary,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ).animate().fadeIn().scale(),
                      _AnimatedIconButton(
                        icon: Icons.refresh,
                        onTap: () => gameNotifier.reset(),
                      ).animate().fadeIn().slideX(begin: 0.5),
                    ],
                  ),
                ),
                
                const Divider(color: Color(0x3300E5FF), height: 1),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        // Scoreboard
                        Row(
                          children: [
                            Expanded(
                              child: _buildScoreCard(
                                emoji: gameState.playerXEmoji,
                                label: 'Player',
                                score: '3',
                                isActive: gameState.currentPlayer == Player.x && gameState.winner == null && !gameState.isDraw,
                                color: NeonColors.primary,
                              ),
                            ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildScoreCard(
                                emoji: gameState.playerOEmoji,
                                label: 'Robot',
                                score: '2',
                                isActive: gameState.currentPlayer == Player.o && gameState.winner == null && !gameState.isDraw,
                                color: Colors.pinkAccent,
                              ),
                            ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.2),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Turn Indicator
                        const Text(
                          'CURRENT TURN',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ).animate().fadeIn(delay: 400.ms),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _AnimatedTurnEmoji(
                              emoji: gameState.currentPlayer == Player.x ? gameState.playerXEmoji : gameState.playerOEmoji,
                              key: ValueKey(gameState.currentPlayer),
                            ),
                            const SizedBox(width: 12),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: Text(
                                gameState.currentPlayer == Player.x ? 'Your Move' : "Robot's Move",
                                key: ValueKey(gameState.currentPlayer),
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ).animate().fadeIn(delay: 500.ms),

                        const SizedBox(height: 40),

                        // 3D Game Grid
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0x660A161E),
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3300E5FF),
                                  blurRadius: 30,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ],
                              border: Border.all(
                                color: NeonColors.primary.withValues(alpha: 0.3),
                                width: 2,
                              ),
                            ),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: 9,
                              itemBuilder: (context, index) {
                                final player = gameState.board[index];
                                final isWinningCell = gameState.winningLine?.contains(index) ?? false;
                                return _GameTile3D(
                                  player: player,
                                  gameState: gameState,
                                  isWinningCell: isWinningCell,
                                  onTap: () => gameNotifier.makeMove(index),
                                );
                              },
                            ),
                          ).animate().fadeIn(delay: 600.ms).scale(curve: Curves.easeOutBack),
                        ),

                        const SizedBox(height: 40),

                        // Info Message
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: NeonColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: NeonColors.primary.withValues(alpha: 0.2)),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.info_outline, color: NeonColors.primary),
                              SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  'Win this match to level up your neon rank!',
                                  style: TextStyle(color: Colors.white70, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2),
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
                          _NavIcon(icon: Icons.sports_esports, label: 'Play', isActive: true, onTap: () {}),
                          _NavIcon(icon: Icons.leaderboard, label: 'Ranks', onTap: () {}), // No route yet
                          _NavIcon(icon: Icons.person, label: 'Profile', onTap: () {}), // No route yet
                          _NavIcon(icon: Icons.settings, label: 'Settings', onTap: () {}),
                        ],
                      ),
                    ),
                  ),
                ).animate().slideY(begin: 1.0, duration: 500.ms),
              ],
            ),
          ),
          
          // Game Over Overlay
          if (gameState.winner != null || gameState.isDraw)
            _GameOverOverlay(
              gameState: gameState,
              onPlayAgain: () => gameNotifier.reset(),
            ),
        ],
      ),
    );
  }

  Widget _buildScoreCard({
    required String emoji,
    required String label,
    required String score,
    required bool isActive,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive ? color.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? color.withValues(alpha: 0.5) : Colors.white10,
          width: isActive ? 2 : 1,
        ),
        boxShadow: isActive
            ? [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 20, spreadRadius: 2)]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.white54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: isActive ? color : Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              shadows: isActive ? [Shadow(color: color, blurRadius: 10)] : null,
            ),
            child: Text(score),
          ),
        ],
      ),
    );
  }
}

class _GameTile3D extends StatefulWidget {
  final Player player;
  final GameState gameState;
  final bool isWinningCell;
  final VoidCallback onTap;

  const _GameTile3D({
    required this.player,
    required this.gameState,
    required this.isWinningCell,
    required this.onTap,
  });

  @override
  State<_GameTile3D> createState() => _GameTile3DState();
}

class _GameTile3DState extends State<_GameTile3D> with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEmpty = widget.player == Player.none;
    final contentColor = widget.player == Player.x ? NeonColors.primary : Colors.pinkAccent;
    final emoji = widget.player == Player.x ? widget.gameState.playerXEmoji : widget.gameState.playerOEmoji;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.translationValues(0, _isPressed ? 4 : (isEmpty ? 0 : -2), 0),
        decoration: BoxDecoration(
          color: widget.isWinningCell
              ? contentColor.withValues(alpha: 0.3)
              : const Color(0xFF142833),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isWinningCell
                ? contentColor
                : Colors.white10,
            width: widget.isWinningCell ? 3 : 1,
          ),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                  if (widget.isWinningCell)
                    BoxShadow(
                      color: contentColor.withValues(alpha: 0.5),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                ],
        ),
        child: Center(
          child: isEmpty
              ? const SizedBox.shrink()
              : Text(
                  emoji,
                  style: TextStyle(
                    fontSize: 40,
                    shadows: [
                      Shadow(
                        color: contentColor,
                        blurRadius: 15,
                      )
                    ],
                  ),
                )
                  .animate(key: ValueKey(widget.player))
                  .scale(curve: Curves.elasticOut, duration: 500.ms)
                  .fadeIn(),
        ),
      ),
    );
  }
}

class _AnimatedTurnEmoji extends StatelessWidget {
  final String emoji;
  const _AnimatedTurnEmoji({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Text(emoji, style: const TextStyle(fontSize: 32))
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scaleXY(begin: 0.9, end: 1.1, duration: 800.ms, curve: Curves.easeInOut);
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
            color: NeonColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: NeonColors.primary.withValues(alpha: 0.3)),
          ),
          child: Icon(widget.icon, color: NeonColors.primary, size: 24),
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

class _GameOverOverlay extends StatelessWidget {
  final GameState gameState;
  final VoidCallback onPlayAgain;

  const _GameOverOverlay({
    required this.gameState,
    required this.onPlayAgain,
  });

  @override
  Widget build(BuildContext context) {
    final isWin = gameState.winner != null;
    final winnerEmoji = gameState.winner == Player.x ? gameState.playerXEmoji : gameState.playerOEmoji;
    
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withValues(alpha: 0.6),
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xFF0C2227),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: isWin ? NeonColors.primary : Colors.white38,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isWin ? NeonColors.primary.withValues(alpha: 0.3) : Colors.black54,
                    blurRadius: 40,
                    spreadRadius: 10,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isWin ? 'VICTORY!' : 'DRAW',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: isWin ? NeonColors.primary : Colors.white,
                      letterSpacing: 4,
                      shadows: isWin ? [const Shadow(color: NeonColors.primary, blurRadius: 20)] : [],
                    ),
                  ).animate().scale(delay: 200.ms, curve: Curves.elasticOut),
                  
                  const SizedBox(height: 24),
                  
                  if (isWin)
                    Text(
                      winnerEmoji,
                      style: const TextStyle(fontSize: 72),
                    ).animate().scale(delay: 400.ms, curve: Curves.elasticOut),
                    
                  if (isWin)
                    const SizedBox(height: 16),
                  
                  Text(
                    isWin ? 'Winner Winner!' : 'A battle of equals.',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ).animate().fadeIn(delay: 600.ms),
                  
                  const SizedBox(height: 40),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: onPlayAgain,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NeonColors.primary,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'PLAY AGAIN',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                      ),
                    ),
                  ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.5),
                ],
              ),
            ).animate().fadeIn().scale(),
          ),
        ),
      ),
    );
  }
}