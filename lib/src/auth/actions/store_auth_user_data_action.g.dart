// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_auth_user_data_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreAuthUserDataAction _$_$_StoreAuthUserDataActionFromJson(
    Map<String, dynamic> json) {
  return _$_StoreAuthUserDataAction(
    json['authUserData'] == null
        ? null
        : AuthUserData.fromJson(json['authUserData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StoreAuthUserDataActionToJson(
        _$_StoreAuthUserDataAction instance) =>
    <String, dynamic>{
      'authUserData': instance.authUserData,
    };
