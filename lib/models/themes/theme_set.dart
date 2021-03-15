import 'package:flireator/enums/themes/theme_brightness.dart';
import 'package:flireator/models/themes/theme_colors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_set.freezed.dart';
part 'theme_set.g.dart';

@freezed
class ThemeSet with _$ThemeSet {
  factory ThemeSet({
    required ThemeColors colors,
    required ThemeBrightness brightness,
  }) = _ThemeSet;

  factory ThemeSet.fromJson(Map<String, dynamic> json) =>
      _$ThemeSetFromJson(json);
}
