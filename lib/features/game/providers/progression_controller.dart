import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/stage_progression.dart';
import '../../../services/isar_service.dart';

part 'progression_controller.g.dart';

@riverpod
class ProgressionController extends _$ProgressionController {
  @override
  Future<List<StageProgression>> build() async {
    final isarService = await ref.watch(isarServiceProvider.future);
    return isarService.getAllStages();
  }

  Future<void> updateStageProgress(int stageNumber, int stars, int moves) async {
    final isarService = await ref.read(isarServiceProvider.future);
    final stages = await future;
    
    final currentStageIndex = stages.indexWhere((s) => s.stageNumber == stageNumber);
    if (currentStageIndex == -1) return;

    final currentStage = stages[currentStageIndex];
    
    // Only update if better performance
    if (stars > currentStage.stars || (stars == currentStage.stars && (currentStage.bestMoves == 0 || moves < currentStage.bestMoves))) {
      currentStage.stars = stars;
      currentStage.bestMoves = moves;
      await isarService.saveStage(currentStage);
    }

    // Unlock next stage if won (stars > 0)
    if (stars > 0 && stageNumber < 45) {
      final nextStageIndex = stages.indexWhere((s) => s.stageNumber == stageNumber + 1);
      if (nextStageIndex != -1 && !stages[nextStageIndex].isUnlocked) {
        stages[nextStageIndex].isUnlocked = true;
        await isarService.saveStage(stages[nextStageIndex]);
      }
    }

    ref.invalidateSelf();
  }
}
