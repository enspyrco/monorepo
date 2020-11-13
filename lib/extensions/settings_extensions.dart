import 'package:flutter/material.dart';
import 'package:the_process/enums/settings/brightness_mode.dart';
import 'package:the_process/enums/settings/theme_brightness.dart';
import 'package:the_process/models/settings/theme_set.dart';

// Static functions must be called on the extension name, ie. NewThemeData
// The naming choice here (ie. MakeThemeData) results in MakeThemeData.from(...)
// which is not bad in this context but may not work in others
extension MakeThemeData on ThemeData {
  static ThemeData from(ThemeSet themeSet) {
    if (themeSet.brightness == ThemeBrightness.light &&
        themeSet.colors.error == null) {
      return ThemeData.from(
          colorScheme: ColorScheme.light(
        primary: Color(themeSet.colors.primary),
        secondary: Color(themeSet.colors.secondary),
      ));
    } else if (themeSet.brightness == ThemeBrightness.light &&
        themeSet.colors.error != null) {
      return ThemeData.from(
          colorScheme: ColorScheme.light(
              primary: Color(themeSet.colors.primary),
              secondary: Color(themeSet.colors.secondary),
              error: Color(themeSet.colors.error)));
    } else if (themeSet.brightness == ThemeBrightness.dark &&
        themeSet.colors.error == null) {
      return ThemeData.from(
          colorScheme: ColorScheme.dark(
        primary: Color(themeSet.colors.primary),
        secondary: Color(themeSet.colors.secondary),
      ));
    } else if (themeSet.brightness == ThemeBrightness.dark &&
        themeSet.colors.error != null) {
      return ThemeData.from(
          colorScheme: ColorScheme.dark(
              primary: Color(themeSet.colors.primary),
              secondary: Color(themeSet.colors.secondary),
              error: Color(themeSet.colors.error)));
    }
    return null;
  }
}

extension MakeThemeMode on ThemeMode {
  static ThemeMode from(BrightnessMode brightness) {
    return (brightness.isLight)
        ? ThemeMode.light
        : (brightness.isDark)
            ? ThemeMode.dark
            : ThemeMode.system;
  }
}
