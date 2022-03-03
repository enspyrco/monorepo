// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$$_SettingsFromJson(Map<String, dynamic> json) => _$_Settings(
      darkTheme: ThemeSet.fromJson(json['darkTheme'] as Map<String, dynamic>),
      lightTheme: ThemeSet.fromJson(json['lightTheme'] as Map<String, dynamic>),
      brightnessMode:
          $enumDecode(_$BrightnessModeEnumEnumMap, json['brightnessMode']),
      platform: $enumDecode(_$PlatformsEnumEnumMap, json['platform']),
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'darkTheme': instance.darkTheme,
      'lightTheme': instance.lightTheme,
      'brightnessMode': _$BrightnessModeEnumEnumMap[instance.brightnessMode],
      'platform': _$PlatformsEnumEnumMap[instance.platform],
    };

const _$BrightnessModeEnumEnumMap = {
  BrightnessModeEnum.light: 'LIGHT',
  BrightnessModeEnum.dark: 'DARK',
  BrightnessModeEnum.system: 'SYSTEM',
};

const _$PlatformsEnumEnumMap = {
  PlatformsEnum.web: 'WEB',
  PlatformsEnum.android: 'ANDROID',
  PlatformsEnum.iOS: 'IOS',
  PlatformsEnum.macOS: 'MACOS',
  PlatformsEnum.fuchsia: 'FUCHSIA',
  PlatformsEnum.linux: 'LINUX',
  PlatformsEnum.windows: 'WINDOWS',
  PlatformsEnum.unknown: 'UNKNOWN',
};
