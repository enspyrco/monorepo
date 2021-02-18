// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asana_project_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AsanaProjectCredentials _$_$_AsanaProjectCredentialsFromJson(
    Map<String, dynamic> json) {
  return _$_AsanaProjectCredentials(
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
    redirectURI: json['redirect_uri'] as String,
  );
}

Map<String, dynamic> _$_$_AsanaProjectCredentialsToJson(
        _$_AsanaProjectCredentials instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'redirect_uri': instance.redirectURI,
    };
