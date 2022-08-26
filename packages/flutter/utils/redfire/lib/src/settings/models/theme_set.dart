import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../enums/theme_brightness_enum.dart';
import 'theme_colors.dart';

part 'theme_set.freezed.dart';
part 'theme_set.g.dart';

@freezed
class ThemeSet with _$ThemeSet {
  factory ThemeSet({
    required ThemeColors colors,
    required ThemeBrightnessEnum brightness,
  }) = _ThemeSet;

  factory ThemeSet.fromJson(JsonMap json) => _$ThemeSetFromJson(json);
}
