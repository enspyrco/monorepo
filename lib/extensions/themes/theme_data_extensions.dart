import 'package:flireator/enums/themes/theme_brightness.dart';
import 'package:flireator/models/themes/theme_set.dart';
import 'package:flutter/material.dart';

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
              error: Color(themeSet.colors.error ?? 0xFF1111)));
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
              error: Color(themeSet.colors.error ?? 0xFF1111)));
    }
    // retunn a default to make the analyzer happy
    return ThemeData.from(
        colorScheme: ColorScheme.dark(
            primary: Color(themeSet.colors.primary),
            secondary: Color(themeSet.colors.secondary),
            error: Color(themeSet.colors.error ?? 0xFF1111)));
  }
}
