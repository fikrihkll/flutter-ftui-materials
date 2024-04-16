import 'package:flutter/material.dart';
import 'package:hello_world/data/setting_shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  final SettingSharedPreferences _settingSharedPreferences = SettingSharedPreferences();
  bool _currentSettingStatus = false;

  @override
  void initState() {
    super.initState();
    _getSettingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
                value: _currentSettingStatus,
                onChanged: (newValue) async {
                  await _saveNewSetting(newValue);
                  await _getSettingStatus();
                }
            )
          ],
        ),
      ),
    );
  }

  Future<void> _saveNewSetting(bool newValue) async {
    await _settingSharedPreferences.saveSetting(newValue);
  }

  Future<void> _getSettingStatus() async {
    _currentSettingStatus = await _settingSharedPreferences.getSetting();
    setState(() {
    });
  }

}
