// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_auth_step_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreAuthStepAction _$$_StoreAuthStepActionFromJson(
        Map<String, dynamic> json) =>
    _$_StoreAuthStepAction(
      _$enumDecode(_$AuthenticationEnumEnumMap, json['step']),
    );

Map<String, dynamic> _$$_StoreAuthStepActionToJson(
        _$_StoreAuthStepAction instance) =>
    <String, dynamic>{
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
