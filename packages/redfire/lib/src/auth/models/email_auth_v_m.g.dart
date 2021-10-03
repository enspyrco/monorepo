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
              (value) => _$enumDecode(_$ProvidersEnumEnumMap, value)),
    );

Map<String, dynamic> _$$_EmailAuthVMToJson(_$_EmailAuthVM instance) =>
    <String, dynamic>{
      'email': instance.email,
      'providers': instance.providers?.toJson(
        (value) => _$ProvidersEnumEnumMap[value],
      ),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ProvidersEnumEnumMap = {
  ProvidersEnum.apple: 'APPLE',
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.email: 'EMAIL',
  ProvidersEnum.asana: 'ASANA',
  ProvidersEnum.gitHub: 'GIT_HUB',
  ProvidersEnum.phone: 'PHONE',
};
