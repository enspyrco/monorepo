import 'package:flutter/material.dart';

import '../enums/theme_brightness_enum.dart';
import '../models/theme_set.dart';

extension ThemeSetExtension on ThemeSet {
  ThemeData get data {
    if (brightness == ThemeBrightnessEnum.light) {
      return ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Color(colors.primary),
          secondary: Color(colors.secondary),
          error: Color(colors.error),
        ),
      );
    } else {
      return ThemeData.from(
        colorScheme: ColorScheme.dark(
          primary: Color(colors.primary),
          secondary: Color(colors.secondary),
          error: Color(colors.error),
        ),
      );
    }
  }
}
