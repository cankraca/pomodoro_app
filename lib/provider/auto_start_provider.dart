import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoStartProvider with ChangeNotifier {
  late SharedPreferences _sharedPreferences;

  static late bool _autoStart;

  static bool get autoStart => _autoStart;

  AutoStartProvider() {
    loadAutoStartFromSharedPref();
  }

  void switchMode() {
    _autoStart = !_autoStart;
    saveAutoStartToSharedPref(_autoStart);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveAutoStartToSharedPref(bool value) {
    _sharedPreferences.setBool('autoStart', value);
  }

  Future<void> loadAutoStartFromSharedPref() async {
    await createSharedPrefObject();
    _autoStart = _sharedPreferences.getBool('autoStart') ?? true;
    notifyListeners();
  }
}
