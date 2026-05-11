import 'package:isar/isar.dart';

part 'settings.g.dart';

@Collection()
class Settings {
  Id id = Isar.autoIncrement;

  late bool isDarkMode;

  late double musicVolume;

  late double sfxVolume;

  late String selectedEmojiPack;
}
