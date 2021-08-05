// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthState _$$_AuthStateFromJson(Map<String, dynamic> json) => _$_AuthState(
      userData: json['userData'] == null
          ? null
          : AuthUserData.fromJson(json['userData'] as Map<String, dynamic>),
      step: _$enumDecode(_$AuthenticationEnumEnumMap, json['step']),
    );

Map<String, dynamic> _$$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'userData': instance.userData,
      'step': _$AuthenticationEnumEnumMap[instance.step],
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

const _$AuthenticationEnumEnumMap = {
  AuthenticationEnum.checking: 'CHECKING',
  AuthenticationEnum.waitingForInput: 'WAITING_FOR_INPUT',
  AuthenticationEnum.contactingApple: 'CONTACTING_APPLE',
  AuthenticationEnum.contactingGoogle: 'CONTACTING_GOOGLE',
  AuthenticationEnum.signingInWithFirebase: 'SIGNING_IN_WITH_FIREBASE',
  AuthenticationEnum.signingOut: 'SIGNING_OUT',
};
