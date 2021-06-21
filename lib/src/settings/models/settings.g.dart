// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$_$_SettingsFromJson(Map<String, dynamic> json) {
  return _$_Settings(
    darkTheme: ThemeSet.fromJson(json['darkTheme'] as Map<String, dynamic>),
    lightTheme: ThemeSet.fromJson(json['lightTheme'] as Map<String, dynamic>),
    brightnessMode:
        _$enumDecode(_$BrightnessModeEnumEnumMap, json['brightnessMode']),
    platform: _$enumDecode(_$PlatformEnumEnumMap, json['platform']),
  );
}

Map<String, dynamic> _$_$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'darkTheme': instance.darkTheme.toJson(),
      'lightTheme': instance.lightTheme.toJson(),
      'brightnessMode': _$BrightnessModeEnumEnumMap[instance.brightnessMode],
      'platform': _$PlatformEnumEnumMap[instance.platform],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$BrightnessModeEnumEnumMap = {
  BrightnessModeEnum.light: 'LIGHT',
  BrightnessModeEnum.dark: 'DARK',
  BrightnessModeEnum.system: 'SYSTEM',
};

const _$PlatformEnumEnumMap = {
  PlatformEnum.web: 'WEB',
  PlatformEnum.android: 'ANDROID',
  PlatformEnum.iOS: 'IOS',
  PlatformEnum.macOS: 'MACOS',
  PlatformEnum.fuchsia: 'FUCHSIA',
  PlatformEnum.linux: 'LINUX',
  PlatformEnum.windows: 'WINDOWS',
  PlatformEnum.unknown: 'UNKNOWN',
};
