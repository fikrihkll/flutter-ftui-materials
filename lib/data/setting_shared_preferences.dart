import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SettingSharedPreferences {

  final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  static const String SETTING_KEY = "some_setting";

  SettingSharedPreferences();

  Future<void> saveSetting(bool isActive) async {
    (await _sharedPreferences).setBool(SETTING_KEY, isActive);
  }

  Future<bool> getSetting() async {
    return (await _sharedPreferences).getBool(SETTING_KEY) ?? false;
  }

}