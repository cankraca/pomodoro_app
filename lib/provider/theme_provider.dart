import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late SharedPreferences _sharedPreferences;

  late bool _isDarkMode;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    loadThemeFromSharedPref();
  }

  void switchTheme() {
    _isDarkMode = !_isDarkMode;
    saveThemeToSharedPref(_isDarkMode);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPreferences.setBool('isDarkMode', value);
  }

  Future<void> loadThemeFromSharedPref() async {
    await createSharedPrefObject();
    _isDarkMode = _sharedPreferences.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
}
