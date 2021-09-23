import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

class PreferencesService {
  Future<void> saveSettings(Settings settings) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', settings.username);
    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setStringList(
        'programmingLanguages',
        settings.programmingLanguages
            .map((lang) => lang.index.toString())
            .toList());

    print('Saved Settings');
  }

  Future<Settings> getSettings() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final username = await preferences.getString('username');
    final isEmployed = await preferences.getBool('isEmployed');
    final gender = await Gender.values[preferences.getInt('gender') ?? 0];
    final programmingLanguagesIndices =
        await preferences.getStringList('programmingLanguages');
    final programmingLanguages = programmingLanguagesIndices!
        .map((stringIndex) =>
            ProgrammingLanguages.values[int.parse(stringIndex)])
        .toSet();

    return Settings(
        username: username as String,
        isEmployed: isEmployed as bool,
        gender: gender,
        programmingLanguages: programmingLanguages);
  }
}
