import 'package:isar/isar.dart';

part 'user_stats.g.dart';

@collection
class UserStats {
  Id id = Isar.autoIncrement;

  int totalWins = 0;
  int totalLosses = 0;
  int totalDraws = 0;
  int totalStars = 0;
  
  DateTime? lastPlayed;
}
