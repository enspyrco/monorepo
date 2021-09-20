// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_providers_for_email_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetProvidersForEmailAction _$$_SetProvidersForEmailActionFromJson(
        Map<String, dynamic> json) =>
    _$_SetProvidersForEmailAction(
      ISet.fromJson(json['providers'],
          (value) => _$enumDecode(_$ProvidersEnumEnumMap, value)),
    );

Map<String, dynamic> _$$_SetProvidersForEmailActionToJson(
        _$_SetProvidersForEmailAction instance) =>
    <String, dynamic>{
      'providers': instance.providers.toJson(
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
