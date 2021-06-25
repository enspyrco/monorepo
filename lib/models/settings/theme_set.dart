import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/enums/settings/theme_brightness_enum.dart';
import 'package:the_process/models/settings/theme_colors.dart';

part 'theme_set.freezed.dart';
part 'theme_set.g.dart';

@freezed
class ThemeSet with _$ThemeSet {
  @JsonSerializable(explicitToJson: true)
  factory ThemeSet({
    required ThemeColors colors,
    required ThemeBrightnessEnum brightness,
  }) = _ThemeSet;

  factory ThemeSet.fromJson(Map<String, dynamic> json) =>
      _$ThemeSetFromJson(json);
}
