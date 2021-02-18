// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_user_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoogleUserCredentials _$_$_GoogleUserCredentialsFromJson(
    Map<String, dynamic> json) {
  return _$_GoogleUserCredentials(
    refresh_token: json['refresh_token'] as String,
    expiry_date: json['expiry_date'] as int,
    access_token: json['access_token'] as String,
    token_type: json['token_type'] as String,
    id_token: json['id_token'] as String,
    scope: json['scope'] as String,
  );
}

Map<String, dynamic> _$_$_GoogleUserCredentialsToJson(
        _$_GoogleUserCredentials instance) =>
    <String, dynamic>{
      'refresh_token': instance.refresh_token,
      'expiry_date': instance.expiry_date,
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'id_token': instance.id_token,
      'scope': instance.scope,
    };
