// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_auth_user_data_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetAuthUserDataAction _$$_SetAuthUserDataActionFromJson(
        Map<String, dynamic> json) =>
    _$_SetAuthUserDataAction(
      json['authUserData'] == null
          ? null
          : AuthUserData.fromJson(json['authUserData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SetAuthUserDataActionToJson(
        _$_SetAuthUserDataAction instance) =>
    <String, dynamic>{
      'authUserData': instance.authUserData,
    };
