// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_page_v_m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthPageVM _$$_AuthPageVMFromJson(Map<String, dynamic> json) =>
    _$_AuthPageVM(
      _$enumDecode(_$PlatformsEnumEnumMap, json['platform']),
      AuthState.fromJson(json['auth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthPageVMToJson(_$_AuthPageVM instance) =>
    <String, dynamic>{
      'platform': _$PlatformsEnumEnumMap[instance.platform],
      'auth': instance.auth,
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
