import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = darkMode;


  ThemeProvider({required bool isDark}){
    _themeData = isDark ? darkMode : lightMode;
  }

  Future<void> toggleTheme(bool change) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (change){
      _themeData = darkMode;
      prefs.setBool("Theme", true);
    } else {
      _themeData = lightMode;
      prefs.setBool("Theme", false);

    }
    notifyListeners();
  }
  ThemeData get themeData => _themeData;
}