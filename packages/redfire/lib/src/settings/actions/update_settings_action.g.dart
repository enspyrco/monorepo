// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_settings_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateSettingsAction _$$_UpdateSettingsActionFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateSettingsAction(
      platform: $enumDecode(_$PlatformsEnumEnumMap, json['platform']),
    );

Map<String, dynamic> _$$_UpdateSettingsActionToJson(
        _$_UpdateSettingsAction instance) =>
    <String, dynamic>{
      'platform': _$PlatformsEnumEnumMap[instance.platform],
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
