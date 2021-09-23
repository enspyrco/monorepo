// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthUserData _$$_AuthUserDataFromJson(Map<String, dynamic> json) =>
    _$_AuthUserData(
      uid: json['uid'] as String,
      tenantId: json['tenantId'] as String?,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      lastSignedInOn: json['lastSignedInOn'] == null
          ? null
          : DateTime.parse(json['lastSignedInOn'] as String),
      isAnonymous: json['isAnonymous'] as bool,
      emailVerified: json['emailVerified'] as bool,
      providers: IList.fromJson(json['providers'],
          (value) => AuthProviderData.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_AuthUserDataToJson(_$_AuthUserData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'tenantId': instance.tenantId,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'createdOn': instance.createdOn?.toIso8601String(),
      'lastSignedInOn': instance.lastSignedInOn?.toIso8601String(),
      'isAnonymous': instance.isAnonymous,
      'emailVerified': instance.emailVerified,
      'providers': instance.providers.toJson(
        (value) => value,
      ),
    };
