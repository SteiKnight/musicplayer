import 'package:flutter/material.dart';
import 'package:musicplayer/themes/dark_mode.dart';
import 'package:musicplayer/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  bool get isDarkMode => _themeData == darkMode;

  void toggleTheme() {
    _themeData = isDarkMode ? lightMode : darkMode;
    notifyListeners();
  }
}
