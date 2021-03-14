import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/enums/platform/platform_enum.dart';
import 'package:the_process/enums/settings/brightness_mode.dart';
import 'package:the_process/enums/settings/theme_brightness.dart';
import 'package:the_process/models/settings/theme_colors.dart';
import 'package:the_process/models/settings/theme_set.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  @JsonSerializable(explicitToJson: true)
  factory Settings({
    required ThemeSet darkTheme,
    required ThemeSet lightTheme,
    required BrightnessMode brightnessMode,
    required PlatformEnum platform,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  factory Settings.init() => Settings(
      darkTheme: ThemeSet(
          brightness: ThemeBrightness.dark, colors: ThemeColors.standard),
      lightTheme: ThemeSet(
          brightness: ThemeBrightness.light, colors: ThemeColors.standard),
      brightnessMode: BrightnessMode.light,
      platform: PlatformEnum.unknown);
}

// library settings;

// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
// import 'package:the_process/enums/platform/platform_enum.dart';
// import 'package:the_process/enums/settings/brightness_mode.dart';
// import 'package:the_process/enums/settings/theme_brightness.dart';
// import 'package:the_process/models/settings/theme_colors.dart';
// import 'package:the_process/models/settings/theme_set.dart';
// import 'package:the_process/serializers.dart';

// part 'settings.g.dart';

// abstract class Settings implements Built<Settings, SettingsBuilder> {
//   ThemeSet get darkTheme;
//   ThemeSet get lightTheme;
//   BrightnessMode get brightnessMode;
//   PlatformEnum get platform;

//   Settings._();

//   static SettingsBuilder initBuilder() {
//     return SettingsBuilder()
//       ..darkTheme.brightness = ThemeBrightness.dark
//       ..darkTheme.colors = ThemeColors.standard.toBuilder()
//       ..lightTheme.brightness = ThemeBrightness.light
//       ..lightTheme.colors = ThemeColors.standard.toBuilder()
//       ..brightnessMode = BrightnessMode.light
//       ..platform = PlatformEnum.unknown;
//   }

//   factory Settings([void Function(SettingsBuilder) updates]) = _$Settings;

//   Object toJson() => serializers.serializeWith(Settings.serializer, this);

//   // static Settings fromJson(String jsonString) =>
//   //     serializers.deserializeWith(Settings.serializer, json.decode(jsonString));

//   static Serializer<Settings> get serializer => _$settingsSerializer;
// }
