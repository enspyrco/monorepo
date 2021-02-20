// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_user_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoogleUserCredentials _$_$_GoogleUserCredentialsFromJson(
    Map<String, dynamic> json) {
  return _$_GoogleUserCredentials(
    refreshToken: json['refresh_token'] as String,
    expiryDate: json['expiry_date'] as int,
    accessToken: json['access_token'] as String,
    tokenType: json['token_type'] as String,
    idToken: json['id_token'] as String,
    scope: json['scope'] as String,
  );
}

Map<String, dynamic> _$_$_GoogleUserCredentialsToJson(
        _$_GoogleUserCredentials instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
      'expiry_date': instance.expiryDate,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'id_token': instance.idToken,
      'scope': instance.scope,
    };
