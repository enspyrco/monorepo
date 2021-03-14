// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider_project_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthProviderProjectCredentials _$_$_AuthProviderProjectCredentialsFromJson(
    Map<String, dynamic> json) {
  return _$_AuthProviderProjectCredentials(
    google: GoogleProjectCredentials.fromJson(
        json['google'] as Map<String, dynamic>),
    asana:
        AsanaProjectCredentials.fromJson(json['asana'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AuthProviderProjectCredentialsToJson(
        _$_AuthProviderProjectCredentials instance) =>
    <String, dynamic>{
      'google': instance.google.toJson(),
      'asana': instance.asana.toJson(),
    };
