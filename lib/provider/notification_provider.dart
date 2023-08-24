import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationProvider with ChangeNotifier {
  late SharedPreferences _sharedPreferences;

  static late bool _isActive;

  static get isActive => _isActive;

  NotificationProvider() {
    loadNotifFromSharedPref();
  }

  void switchMode() {
    _isActive = !_isActive;
    saveNotifToSharedPref(_isActive);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveNotifToSharedPref(bool value) {
    _sharedPreferences.setBool('isActive', value);
  }

  Future<void> loadNotifFromSharedPref() async {
    await createSharedPrefObject();
    _isActive = _sharedPreferences.getBool('isActive') ?? true;
    notifyListeners();
  }
}
