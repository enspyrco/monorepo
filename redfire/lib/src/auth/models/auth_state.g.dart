// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthState _$$_AuthStateFromJson(Map<String, dynamic> json) => _$_AuthState(
      emailVM: EmailAuthVM.fromJson(json['emailVM'] as Map<String, dynamic>),
      userData: json['userData'] == null
          ? null
          : AuthUserData.fromJson(json['userData'] as Map<String, dynamic>),
      idTokenResult: json['idTokenResult'] == null
          ? null
          : IdTokenResult.fromJson(
              json['idTokenResult'] as Map<String, dynamic>),
      step: _$enumDecode(_$AuthStepEnumEnumMap, json['step']),
    );

Map<String, dynamic> _$$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'emailVM': instance.emailVM,
      'userData': instance.userData,
      'idTokenResult': instance.idTokenResult,
      'step': _$AuthStepEnumEnumMap[instance.step],
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

const _$AuthStepEnumEnumMap = {
  AuthStepEnum.checking: 'CHECKING',
  AuthStepEnum.waitingForInput: 'WAITING_FOR_INPUT',
  AuthStepEnum.contactingApple: 'CONTACTING_APPLE',
  AuthStepEnum.contactingGoogle: 'CONTACTING_GOOGLE',
  AuthStepEnum.signingInWithFirebase: 'SIGNING_IN_WITH_FIREBASE',
  AuthStepEnum.signingOut: 'SIGNING_OUT',
};
