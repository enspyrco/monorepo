// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_token_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IdTokenResult _$$_IdTokenResultFromJson(Map<String, dynamic> json) =>
    _$_IdTokenResult(
      authTime: json['authTime'] == null
          ? null
          : DateTime.parse(json['authTime'] as String),
      claims: json['claims'] as Map<String, dynamic>?,
      expirationTime: json['expirationTime'] == null
          ? null
          : DateTime.parse(json['expirationTime'] as String),
      issuedAtTime: json['issuedAtTime'] == null
          ? null
          : DateTime.parse(json['issuedAtTime'] as String),
      signInProvider:
          $enumDecodeNullable(_$ProvidersEnumEnumMap, json['signInProvider']),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_IdTokenResultToJson(_$_IdTokenResult instance) =>
    <String, dynamic>{
      'authTime': instance.authTime?.toIso8601String(),
      'claims': instance.claims,
      'expirationTime': instance.expirationTime?.toIso8601String(),
      'issuedAtTime': instance.issuedAtTime?.toIso8601String(),
      'signInProvider': _$ProvidersEnumEnumMap[instance.signInProvider],
      'token': instance.token,
    };

const _$ProvidersEnumEnumMap = {
  ProvidersEnum.apple: 'APPLE',
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.email: 'EMAIL',
  ProvidersEnum.gitHub: 'GIT_HUB',
};
