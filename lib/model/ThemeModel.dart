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
        }break;
        case "purple":
        {
          currentTheme = purpleTheme;
          // _themeType = ThemeType.PurpleTheme;
          return notifyListeners();
        }break;
        case "light":
        {
          currentTheme = lightTheme;
          // _themeType = ThemeType.LightTheme;
          return notifyListeners();
        }break;
        case "dark":
        {
          currentTheme  = darkTheme;
          // _themeType = ThemeType.DarkTheme;
          return notifyListeners();
        }break;
        default:{
        // _themeType = ThemeType.BlueTheme;
        return notifyListeners();
        }
    }
  }
}