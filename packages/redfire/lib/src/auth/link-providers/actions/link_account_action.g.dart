// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_account_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LinkAccountAction _$$_LinkAccountActionFromJson(Map<String, dynamic> json) =>
    _$_LinkAccountAction(
      $enumDecode(_$ProvidersEnumEnumMap, json['provider']),
    );

Map<String, dynamic> _$$_LinkAccountActionToJson(
        _$_LinkAccountAction instance) =>
    <String, dynamic>{
      'provider': _$ProvidersEnumEnumMap[instance.provider],
    };

const _$ProvidersEnumEnumMap = {
  ProvidersEnum.apple: 'APPLE',
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.email: 'EMAIL',
  ProvidersEnum.gitHub: 'GIT_HUB',
};
