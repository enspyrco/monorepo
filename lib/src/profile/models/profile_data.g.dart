// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileData _$$_ProfileDataFromJson(Map<String, dynamic> json) =>
    _$_ProfileData(
      id: json['id'] as String,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      authorizationStatus:
          (json['authorizationStatus'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(_$enumDecode(_$ProvidersEnumEnumMap, k),
            _$enumDecode(_$AuthorizationEnumEnumMap, e)),
      ),
    );

Map<String, dynamic> _$$_ProfileDataToJson(_$_ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'authorizationStatus': instance.authorizationStatus.map((k, e) =>
          MapEntry(_$ProvidersEnumEnumMap[k], _$AuthorizationEnumEnumMap[e])),
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

const _$AuthorizationEnumEnumMap = {
  AuthorizationEnum.waitingForInput: 'WAITING_FOR_INPUT',
  AuthorizationEnum.gettingAuthorized: 'GETTING_AUTHORIZED',
  AuthorizationEnum.authorized: 'AUTHORIZED',
  AuthorizationEnum.unknown: 'UNKOWN',
};

const _$ProvidersEnumEnumMap = {
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.asana: 'ASANA',
  ProvidersEnum.gitHub: 'GIT_HUB',
};
