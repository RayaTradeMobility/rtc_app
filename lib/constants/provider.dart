import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late bool _isDarkMode;
  late ThemeMode _mode;

  ThemeProvider({bool isDarkMode = false}) {
    _isDarkMode = isDarkMode;
    _mode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isDarkMode => _isDarkMode;

  ThemeMode get mode => _mode;

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    _mode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }

  void setMode(ThemeMode newMode) async {
    _mode = newMode;
    _isDarkMode = newMode == ThemeMode.dark;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }
}
