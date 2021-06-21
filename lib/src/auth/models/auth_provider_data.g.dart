// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthProviderData _$_$_AuthProviderDataFromJson(Map<String, dynamic> json) {
  return _$_AuthProviderData(
    providerId: json['providerId'] as String,
    uid: json['uid'] as String?,
    displayName: json['displayName'] as String?,
    photoURL: json['photoURL'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$_$_AuthProviderDataToJson(
        _$_AuthProviderData instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'uid': instance.uid,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
