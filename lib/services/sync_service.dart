import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'isar_service.dart';
import 'supabase_service.dart';

part 'sync_service.g.dart';

@Riverpod(keepAlive: true)
class SyncService extends _$SyncService {
  @override
  void build() {}

  Future<void> syncProgression() async {
    final isarService = await ref.read(isarServiceProvider.future);
    final supabaseService = await ref.read(supabaseServiceProvider.future);

    if (supabaseService.currentUser == null) return;

    final localStages = await isarService.getAllStages();
    
    for (final stage in localStages) {
      if (stage.stars > 0) {
        await supabaseService.client.from('progression').upsert({
          'user_id': supabaseService.currentUser!.id,
          'stage_number': stage.stageNumber,
          'stars': stage.stars,
          'best_moves': stage.bestMoves,
        }, onConflict: 'user_id,stage_number');
      }
    }
  }

  Future<void> syncStats() async {
    final isarService = await ref.read(isarServiceProvider.future);
    final supabaseService = await ref.read(supabaseServiceProvider.future);

    if (supabaseService.currentUser == null) return;

    final stats = await isarService.getStats();
    
    await supabaseService.client.from('user_stats').upsert({
      'user_id': supabaseService.currentUser!.id,
      'total_wins': stats.totalWins,
      'total_losses': stats.totalLosses,
      'total_draws': stats.totalDraws,
      'total_stars': stats.totalStars,
    }, onConflict: 'user_id');
  }
}
