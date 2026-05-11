import 'package:isar/isar.dart';

part 'stage_progression.g.dart';

@collection
class StageProgression {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int stageNumber;

  late bool isUnlocked;
  late int stars; // 0 to 3
  late int bestMoves;
  
  StageProgression({
    required this.stageNumber,
    this.isUnlocked = false,
    this.stars = 0,
    this.bestMoves = 0,
  });
}
