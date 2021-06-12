// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$_$_AppStateFromJson(Map<String, dynamic> json) {
  return _$_AppState(
    redFirePages: IList.fromJson(json['redFirePages'],
        (value) => RedFirePage.fromJson(value as Map<String, dynamic>)),
    problems: IList.fromJson(json['problems'],
        (value) => ProblemInfo.fromJson(value as Map<String, dynamic>)),
    settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
    authStep: _$enumDecode(_$AuthStepEnumEnumMap, json['authStep']),
    authUserData: json['authUserData'] == null
        ? null
        : AuthUserData.fromJson(json['authUserData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'redFirePages': instance.redFirePages.toJson(
        (value) => value,
      ),
      'problems': instance.problems.toJson(
        (value) => value,
      ),
      'settings': instance.settings,
      'authStep': _$AuthStepEnumEnumMap[instance.authStep],
      'authUserData': instance.authUserData,
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
