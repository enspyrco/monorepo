import 'package:flutter/material.dart';
import 'package:redfire/settings/enums/brightness_mode_enum.dart';

extension BrightnessModeEnumExtension on BrightnessModeEnum {
  ThemeMode toThemeMode() => (this == BrightnessModeEnum.light)
      ? ThemeMode.light
      : (this == BrightnessModeEnum.dark)
          ? ThemeMode.dark
          : ThemeMode.system;
}
