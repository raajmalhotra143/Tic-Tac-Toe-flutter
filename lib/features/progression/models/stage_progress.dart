import 'package:isar/isar.dart';

part 'stage_progress.g.dart';

@Collection()
class StageProgress {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int stageNumber;

  late int stars;

  late bool isUnlocked;

  late bool isCompleted;
}
