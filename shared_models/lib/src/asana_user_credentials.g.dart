// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asana_user_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AsanaUserCredentials _$_$_AsanaUserCredentialsFromJson(
    Map<String, dynamic> json) {
  return _$_AsanaUserCredentials(
    refresh_token: json['refresh_token'] as String,
    access_token: json['access_token'] as String,
    expires_in: json['expires_in'] as int,
  );
}

Map<String, dynamic> _$_$_AsanaUserCredentialsToJson(
        _$_AsanaUserCredentials instance) =>
    <String, dynamic>{
      'refresh_token': instance.refresh_token,
      'access_token': instance.access_token,
      'expires_in': instance.expires_in,
    };
