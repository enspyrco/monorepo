// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_auth_v_m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmailAuthVM _$$_EmailAuthVMFromJson(Map<String, dynamic> json) =>
    _$_EmailAuthVM(
      email: json['email'] as String?,
      providers: json['providers'] == null
          ? null
          : ISet<ProvidersEnum>.fromJson(json['providers'],
              (value) => $enumDecode(_$ProvidersEnumEnumMap, value)),
    );

Map<String, dynamic> _$$_EmailAuthVMToJson(_$_EmailAuthVM instance) =>
    <String, dynamic>{
      'email': instance.email,
      'providers': instance.providers?.toJson(
        (value) => _$ProvidersEnumEnumMap[value],
      ),
    };

const _$ProvidersEnumEnumMap = {
  ProvidersEnum.apple: 'APPLE',
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.email: 'EMAIL',
  ProvidersEnum.gitHub: 'GIT_HUB',
};
