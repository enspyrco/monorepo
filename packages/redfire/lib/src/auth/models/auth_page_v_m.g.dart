// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_page_v_m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthPageVM _$$_AuthPageVMFromJson(Map<String, dynamic> json) =>
    _$_AuthPageVM(
      $enumDecode(_$PlatformsEnumEnumMap, json['platform']),
      AuthState.fromJson(json['auth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthPageVMToJson(_$_AuthPageVM instance) =>
    <String, dynamic>{
      'platform': _$PlatformsEnumEnumMap[instance.platform],
      'auth': instance.auth,
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
