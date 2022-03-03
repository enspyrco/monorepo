// Static functions must be called on the extension name, ie. NewThemeData
// The naming choice here (ie. MakeThemeData) results in MakeThemeData.from(...)
// which is not bad in this context but may not work in others

import 'package:flutter/material.dart';

import '../enums/theme_brightness_enum.dart';
import '../models/theme_set.dart';

extension MakeThemeData on ThemeData {
  static ThemeData from(ThemeSet themeSet) {
    if (themeSet.brightness == ThemeBrightnessEnum.light) {
      return ThemeData.from(
          colorScheme: ColorScheme.light(
              primary: Color(themeSet.colors.primary),
              secondary: Color(themeSet.colors.secondary),
              error: Color(themeSet.colors.error)));
    } else {
      return ThemeData.from(
          colorScheme: ColorScheme.dark(
              primary: Color(themeSet.colors.primary),
              secondary: Color(themeSet.colors.secondary),
              error: Color(themeSet.colors.error)));
    }
  }
}
