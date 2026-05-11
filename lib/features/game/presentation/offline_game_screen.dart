import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/neon_theme.dart';
import '../logic/tic_tac_toe_logic.dart';
import '../providers/game_controller.dart';
import '../providers/progression_controller.dart';

class OfflineGameScreen extends ConsumerWidget {
  const OfflineGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameControllerProvider);
    final gameNotifier = ref.read(gameControllerProvider.notifier);

    // Listen for game end to update progression
    ref.listen(gameControllerProvider, (previous, next) {
      if ((next.winner != null || next.isDraw) && (previous?.winner == null && previous?.isDraw == false)) {
        if (next.winner == Player.x) {
          final stars = TicTacToeLogic.calculateStars(next.moves);
          ref.read(progressionControllerProvider.notifier).updateStageProgress(1, stars, next.moves);
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('GAME GRID'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => gameNotifier.reset(),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTurnIndicator(context, gameState),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              margin: const EdgeInsets.all(32),
              decoration: NeonEffects.neonBox(color: NeonColors.neonCyan),
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final player = gameState.board[index];
                  return GestureDetector(
                    onTap: () => gameNotifier.makeMove(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: NeonColors.neonCyan.withValues(alpha: 0.1)),
                      ),
                      child: Center(
                        child: _buildPlayerIcon(player),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (gameState.winner != null || gameState.isDraw)
            _buildResultOverlay(context, gameState, gameNotifier),
        ],
      ),
    );
  }

  Widget _buildTurnIndicator(BuildContext context, GameState state) {
    final isX = state.currentPlayer == Player.x;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TurnBadge(label: 'X', isActive: isX, color: NeonColors.neonCyan),
        const SizedBox(width: 20),
        _TurnBadge(label: 'O', isActive: !isX, color: NeonColors.neonMagenta),
      ],
    );
  }

  Widget _buildPlayerIcon(Player player) {
    if (player == Player.x) {
      return const Icon(Icons.close, color: NeonColors.neonCyan, size: 64);
    } else if (player == Player.o) {
      return const Icon(Icons.circle_outlined, color: NeonColors.neonMagenta, size: 56);
    }
    return const SizedBox.shrink();
  }

  Widget _buildResultOverlay(BuildContext context, GameState state, GameController notifier) {
    final message = state.winner == Player.x 
        ? 'VICTORY' 
        : (state.winner == Player.o ? 'DEFEAT' : 'DRAW');
    final color = state.winner == Player.x ? NeonColors.neonCyan : (state.winner == Player.o ? NeonColors.neonMagenta : Colors.grey);

    return Column(
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(color: color),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => notifier.reset(),
          style: ElevatedButton.styleFrom(backgroundColor: color),
          child: const Text('RETRY'),
        ),
      ],
    );
  }
}

class _TurnBadge extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color color;

  const _TurnBadge({required this.label, required this.isActive, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: isActive 
          ? NeonEffects.neonBox(color: color, borderRadius: 8)
          : BoxDecoration(
              border: Border.all(color: Colors.white24),
              borderRadius: BorderRadius.circular(8),
            ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: isActive ? color : Colors.white24,
        ),
      ),
    );
  }
}
