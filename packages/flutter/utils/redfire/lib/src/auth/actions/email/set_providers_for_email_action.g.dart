// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_providers_for_email_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetProvidersForEmailAction _$$_SetProvidersForEmailActionFromJson(
        Map<String, dynamic> json) =>
    _$_SetProvidersForEmailAction(
      ISet<ProvidersEnum>.fromJson(json['providers'],
          (value) => $enumDecode(_$ProvidersEnumEnumMap, value)),
    );

Map<String, dynamic> _$$_SetProvidersForEmailActionToJson(
        _$_SetProvidersForEmailAction instance) =>
    <String, dynamic>{
      'providers': instance.providers.toJson(
        (value) => _$ProvidersEnumEnumMap[value],
      ),
    };

const _$ProvidersEnumEnumMap = {
  ProvidersEnum.apple: 'APPLE',
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.email: 'EMAIL',
  ProvidersEnum.gitHub: 'GIT_HUB',
};
