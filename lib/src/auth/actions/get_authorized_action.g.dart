// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_authorized_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetAuthorizedAction _$_$_GetAuthorizedActionFromJson(
    Map<String, dynamic> json) {
  return _$_GetAuthorizedAction(
    provider: _$enumDecode(_$ProvidersEnumEnumMap, json['provider']),
  );
}

Map<String, dynamic> _$_$_GetAuthorizedActionToJson(
        _$_GetAuthorizedAction instance) =>
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
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.asana: 'ASANA',
};
