// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sign_in_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoogleSignInCredential _$_$_GoogleSignInCredentialFromJson(
    Map<String, dynamic> json) {
  return _$_GoogleSignInCredential(
    idToken: json['idToken'] as String?,
    accessToken: json['accessToken'] as String?,
    serverAuthCode: json['serverAuthCode'] as String?,
  );
}

Map<String, dynamic> _$_$_GoogleSignInCredentialToJson(
        _$_GoogleSignInCredential instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'accessToken': instance.accessToken,
      'serverAuthCode': instance.serverAuthCode,
    };
