// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccessCredentials _$$_AccessCredentialsFromJson(Map<String, dynamic> json) =>
    _$_AccessCredentials(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      idToken: json['idToken'] as String,
      scopes: IList.fromJson(json['scopes'], (value) => value as String),
    );

Map<String, dynamic> _$$_AccessCredentialsToJson(
        _$_AccessCredentials instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'idToken': instance.idToken,
      'scopes': instance.scopes.toJson(
        (value) => value,
      ),
    };
