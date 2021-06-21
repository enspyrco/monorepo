// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_auth_step_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreAuthStepAction _$_$_StoreAuthStepActionFromJson(
    Map<String, dynamic> json) {
  return _$_StoreAuthStepAction(
    _$enumDecode(_$AuthStepEnumEnumMap, json['step']),
  );
}

Map<String, dynamic> _$_$_StoreAuthStepActionToJson(
        _$_StoreAuthStepAction instance) =>
    <String, dynamic>{
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
