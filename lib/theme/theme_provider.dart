import 'package:flutter/material.dart';
import 'package:flutter_application_1/settings/sharedPreferencesHelper.dart';
import 'package:flutter_application_1/theme/theme.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = darkMode;

  static var isDark;


  ThemeProvider({required bool isDark}){
    _themeData = isDark ? darkMode : lightMode;
  }

  Future<void> toggleTheme(bool change) async {
    SharedPreferencesHelper.init();
    if (change){
      _themeData = darkMode;
      SharedPreferencesHelper.setBool("Theme", true);
    } else {
      _themeData = lightMode;
      SharedPreferencesHelper.setBool("Theme", false);
    }
    notifyListeners();
  }
  ThemeData get themeData => _themeData;
}