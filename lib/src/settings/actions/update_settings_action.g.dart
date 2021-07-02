// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_settings_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateSettingsAction _$_$_UpdateSettingsActionFromJson(
    Map<String, dynamic> json) {
  return _$_UpdateSettingsAction(
    platform: _$enumDecode(_$PlatformsEnumEnumMap, json['platform']),
  );
}

Map<String, dynamic> _$_$_UpdateSettingsActionToJson(
        _$_UpdateSettingsAction instance) =>
    <String, dynamic>{
      'platform': _$PlatformsEnumEnumMap[instance.platform],
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
