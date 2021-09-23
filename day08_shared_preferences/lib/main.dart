import 'package:day08_shared_preferences/models.dart';
import 'package:day08_shared_preferences/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencesService();
  final _usernameController = TextEditingController();
  var _selectGender = Gender.NONE;
  var _selectedLanguages = Set<ProgrammingLanguages>();
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _isEmployed = settings.isEmployed;
      _selectGender = settings.gender;
      _selectedLanguages = settings.programmingLanguages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('User Settings'),
          ),
          body: ListView(
            children: [
              ListTile(
                  title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              )),
              RadioListTile(
                  title: Text('Female'),
                  value: (Gender.FEMALE),
                  groupValue: _selectGender,
                  onChanged: (newValue) =>
                      setState(() => _selectGender = newValue as Gender)),
              RadioListTile(
                  title: Text('Male'),
                  value: (Gender.MALE),
                  groupValue: _selectGender,
                  onChanged: (newValue) =>
                      setState(() => _selectGender = newValue as Gender)),
              RadioListTile(
                  title: Text('Other'),
                  value: (Gender.OTHER),
                  groupValue: _selectGender,
                  onChanged: (newValue) =>
                      setState(() => _selectGender = newValue as Gender)),
              CheckboxListTile(
                value: _selectedLanguages.contains(ProgrammingLanguages.DART),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguages.contains(ProgrammingLanguages.DART)
                        ? _selectedLanguages.remove(ProgrammingLanguages.DART)
                        : _selectedLanguages.add(ProgrammingLanguages.DART);
                  });
                },
                title: Text('Dart'),
              ),
              CheckboxListTile(
                value: _selectedLanguages
                    .contains(ProgrammingLanguages.JAVASCRIPT),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguages.contains(ProgrammingLanguages.JAVASCRIPT)
                        ? _selectedLanguages
                            .remove(ProgrammingLanguages.JAVASCRIPT)
                        : _selectedLanguages
                            .add(ProgrammingLanguages.JAVASCRIPT);
                  });
                },
                title: Text('JavaScript'),
              ),
              CheckboxListTile(
                value: _selectedLanguages.contains(ProgrammingLanguages.PYTHON),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguages.contains(ProgrammingLanguages.PYTHON)
                        ? _selectedLanguages.remove(ProgrammingLanguages.PYTHON)
                        : _selectedLanguages.add(ProgrammingLanguages.PYTHON);
                  });
                },
                title: Text('Python'),
              ),
              CheckboxListTile(
                value: _selectedLanguages.contains(ProgrammingLanguages.C),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguages.contains(ProgrammingLanguages.C)
                        ? _selectedLanguages.remove(ProgrammingLanguages.C)
                        : _selectedLanguages.add(ProgrammingLanguages.C);
                  });
                },
                title: Text('C'),
              ),
              SwitchListTile(
                  title: Text('Is Employed'),
                  value: _isEmployed,
                  onChanged: (newValue) =>
                      setState(() => _isEmployed = newValue)),
              TextButton(
                child: Text('Save Settings'),
                onPressed: _saveSettings,
              )
            ],
          )),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
        username: _usernameController.text,
        gender: _selectGender,
        programmingLanguages: _selectedLanguages,
        isEmployed: _isEmployed);

    print(newSettings);
    _preferencesService.saveSettings(newSettings);
  }
}
