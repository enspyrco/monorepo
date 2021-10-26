// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_account_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LinkAccountAction _$$_LinkAccountActionFromJson(Map<String, dynamic> json) =>
    _$_LinkAccountAction(
      _$enumDecode(_$ProvidersEnumEnumMap, json['provider']),
    );

Map<String, dynamic> _$$_LinkAccountActionToJson(
        _$_LinkAccountAction instance) =>
    <String, dynamic>{
      'provider': _$ProvidersEnumEnumMap[instance.provider],
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
  ProvidersEnum.gitHub: 'GIT_HUB',
};
