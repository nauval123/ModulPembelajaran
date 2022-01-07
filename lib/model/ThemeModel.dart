import 'package:flutter/material.dart';
import 'package:modul_pembelajaran_kimia/common/theme.dart';

// enum ThemeType { BlueTheme,PurpleTheme,LightTheme, DarkTheme }

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = blueTheme;
  // ThemeType _themeType = ThemeType.BlueTheme;

  toggleTheme(String colourtheme) {
    switch (colourtheme) {
      case "blue":
        {
          currentTheme = blueTheme;
          // _themeType = ThemeType.BlueTheme;
          return notifyListeners();
        // ignore: dead_code
        }break;
        case "purple":
        {
          currentTheme = purpleTheme;
          // _themeType = ThemeType.PurpleTheme;
          return notifyListeners();
        // ignore: dead_code
        }break;
        case "light":
        {
          currentTheme = lightTheme;
          // _themeType = ThemeType.LightTheme;
          return notifyListeners();
        // ignore: dead_code
        }break;
        case "dark":
        {
          currentTheme  = darkTheme;
          // _themeType = ThemeType.DarkTheme;
          return notifyListeners();
        // ignore: dead_code
        }break;
        default:{
        // _themeType = ThemeType.BlueTheme;
        return notifyListeners();
        }
    }
  }
}