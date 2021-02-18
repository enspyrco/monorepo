// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_project_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoogleProjectCredentials _$_$_GoogleProjectCredentialsFromJson(
    Map<String, dynamic> json) {
  return _$_GoogleProjectCredentials(
    id: json['id'] as String,
    secret: json['secret'] as String,
    redirectURL: json['redirect_url'] as String,
  );
}

Map<String, dynamic> _$_$_GoogleProjectCredentialsToJson(
        _$_GoogleProjectCredentials instance) =>
    <String, dynamic>{
      'id': instance.id,
      'secret': instance.secret,
      'redirect_url': instance.redirectURL,
    };
