import 'package:flireator/enums/themes/brightness_mode.dart';
import 'package:flutter/material.dart';
import 'package:flireator/extensions/themes/brightness_mode_extensions.dart';

extension MakeThemeMode on ThemeMode {
  static ThemeMode from(BrightnessMode brightness) {
    return (brightness.isLight)
        ? ThemeMode.light
        : (brightness.isDark)
            ? ThemeMode.dark
            : ThemeMode.system;
  }
}
