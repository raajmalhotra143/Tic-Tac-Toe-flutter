import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/models/stage_progression.dart';
import '../core/models/user_stats.dart';

part 'isar_service.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(IsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [StageProgressionSchema, UserStatsSchema],
    directory: dir.path,
  );
}

class IsarService {
  final Isar isar;

  IsarService(this.isar);

  // Stage Progression Methods
  Future<List<StageProgression>> getAllStages() async {
    return isar.stageProgressions.where().sortByStageNumber().findAll();
  }

  Future<void> saveStage(StageProgression stage) async {
    await isar.writeTxn(() async {
      await isar.stageProgressions.put(stage);
    });
  }

  Future<void> initializeStagesIfEmpty() async {
    final count = await isar.stageProgressions.count();
    if (count == 0) {
      await isar.writeTxn(() async {
        for (int i = 1; i <= 45; i++) {
          await isar.stageProgressions.put(
            StageProgression(
              stageNumber: i,
              isUnlocked: i == 1, // Only first stage is unlocked
            ),
          );
        }
      });
    }
  }

  // User Stats Methods
  Future<UserStats> getStats() async {
    final stats = await isar.userStats.where().findFirst();
    if (stats == null) {
      final newStats = UserStats();
      await isar.writeTxn(() async {
        await isar.userStats.put(newStats);
      });
      return newStats;
    }
    return stats;
  }

  Future<void> updateStats(UserStats stats) async {
    await isar.writeTxn(() async {
      await isar.userStats.put(stats);
    });
  }
}

@Riverpod(keepAlive: true)
Future<IsarService> isarService(IsarServiceRef ref) async {
  final isarInstance = await ref.watch(isarProvider.future);
  final service = IsarService(isarInstance);
  await service.initializeStagesIfEmpty();
  return service;
}
