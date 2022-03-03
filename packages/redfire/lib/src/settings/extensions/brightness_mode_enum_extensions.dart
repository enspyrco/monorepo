import 'package:flutter/material.dart';

import '../enums/brightness_mode_enum.dart';

extension BrightnessModeEnumExtension on BrightnessModeEnum {
  ThemeMode get theme => (this == BrightnessModeEnum.light)
      ? ThemeMode.light
      : (this == BrightnessModeEnum.dark)
          ? ThemeMode.dark
          : ThemeMode.system;
}
