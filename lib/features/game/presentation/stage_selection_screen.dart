import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/neon_theme.dart';
import '../providers/progression_controller.dart';
import '../providers/game_controller.dart';

class StageSelectionScreen extends ConsumerWidget {
  const StageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stagesAsync = ref.watch(progressionControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('CAMPAIGN')),
      body: stagesAsync.when(
        data: (stages) => GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: stages.length,
          itemBuilder: (context, index) {
            final stage = stages[index];
            final isUnlocked = stage.isUnlocked;

            return GestureDetector(
              onTap: isUnlocked
                  ? () {
                      final difficulty = stage.stageNumber <= 15
                          ? 'easy'
                          : (stage.stageNumber <= 30 ? 'normal' : 'impossible');
                      ref.read(gameControllerProvider.notifier).setDifficulty(difficulty);
                      context.push('/game/offline');
                    }
                  : null,
              child: Container(
                decoration: NeonEffects.neonBox(
                  color: isUnlocked ? NeonColors.neonCyan : Colors.grey,
                  borderRadius: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${stage.stageNumber}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isUnlocked ? NeonColors.neonCyan : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isUnlocked)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (i) {
                          return Icon(
                            i < stage.stars ? Icons.star : Icons.star_border,
                            color: NeonColors.neonLime,
                            size: 12,
                          );
                        }),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
