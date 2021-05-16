// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_id_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppleIdCredential _$_$_AppleIdCredentialFromJson(Map<String, dynamic> json) {
  return _$_AppleIdCredential(
    userIdentifier: json['userIdentifier'] as String?,
    givenName: json['givenName'] as String?,
    familyName: json['familyName'] as String?,
    email: json['email'] as String?,
    authorizationCode: json['authorizationCode'] as String,
    identityToken: json['identityToken'] as String?,
    state: json['state'] as String?,
  );
}

Map<String, dynamic> _$_$_AppleIdCredentialToJson(
        _$_AppleIdCredential instance) =>
    <String, dynamic>{
      'userIdentifier': instance.userIdentifier,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'email': instance.email,
      'authorizationCode': instance.authorizationCode,
      'identityToken': instance.identityToken,
      'state': instance.state,
    };
