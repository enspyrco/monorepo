import 'package:flireator/enums/themes/brightness_mode.dart';
import 'package:flireator/enums/themes/theme_brightness.dart';
import 'package:flireator/models/themes/theme_colors.dart';
import 'package:flireator/models/themes/theme_set.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  factory Settings({
    required ThemeSet darkTheme,
    required ThemeSet lightTheme,
    required BrightnessMode brightnessMode,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  factory Settings.init() => Settings(
      darkTheme: ThemeSet(
          brightness: ThemeBrightness.dark, colors: ThemeColors.standard()),
      lightTheme: ThemeSet(
          brightness: ThemeBrightness.light, colors: ThemeColors.standard()),
      brightnessMode: BrightnessMode.light);
}
