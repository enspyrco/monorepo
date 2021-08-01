import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/settings/enums/brightness_mode_enum.dart';
import 'package:redfire/src/settings/enums/platform_enum.dart';
import 'package:redfire/src/settings/enums/theme_brightness_enum.dart';
import 'package:redfire/src/settings/models/theme_colors.dart';
import 'package:redfire/src/settings/models/theme_set.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  factory Settings({
    required ThemeSet darkTheme,
    required ThemeSet lightTheme,
    required BrightnessModeEnum brightnessMode,
    required PlatformsEnum platform,
  }) = _Settings;

  factory Settings.init() => Settings(
      darkTheme: ThemeSet(
          brightness: ThemeBrightnessEnum.dark, colors: ThemeColors.standard),
      lightTheme: ThemeSet(
          brightness: ThemeBrightnessEnum.light, colors: ThemeColors.standard),
      brightnessMode: BrightnessModeEnum.light,
      platform: PlatformsEnum.unknown);

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
