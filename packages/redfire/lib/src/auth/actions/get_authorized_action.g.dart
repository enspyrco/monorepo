// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_authorized_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetAuthorizedAction _$$_GetAuthorizedActionFromJson(
        Map<String, dynamic> json) =>
    _$_GetAuthorizedAction(
      provider: $enumDecode(_$ProvidersEnumEnumMap, json['provider']),
    );

Map<String, dynamic> _$$_GetAuthorizedActionToJson(
        _$_GetAuthorizedAction instance) =>
    <String, dynamic>{
      'provider': _$ProvidersEnumEnumMap[instance.provider],
    };

const _$ProvidersEnumEnumMap = {
  ProvidersEnum.apple: 'APPLE',
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.email: 'EMAIL',
  ProvidersEnum.gitHub: 'GIT_HUB',
};
