// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_settings_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateSettingsAction _$_$_UpdateSettingsActionFromJson(
    Map<String, dynamic> json) {
  return _$_UpdateSettingsAction(
    platform: _$enumDecode(_$PlatformEnumEnumMap, json['platform']),
  );
}

Map<String, dynamic> _$_$_UpdateSettingsActionToJson(
        _$_UpdateSettingsAction instance) =>
    <String, dynamic>{
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
