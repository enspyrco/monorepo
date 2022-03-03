// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_auth_step_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetAuthStepAction _$$_SetAuthStepActionFromJson(Map<String, dynamic> json) =>
    _$_SetAuthStepAction(
      $enumDecode(_$AuthStepEnumEnumMap, json['step']),
    );

Map<String, dynamic> _$$_SetAuthStepActionToJson(
        _$_SetAuthStepAction instance) =>
    <String, dynamic>{
      'step': _$AuthStepEnumEnumMap[instance.step],
    };

const _$AuthStepEnumEnumMap = {
  AuthStepEnum.checking: 'CHECKING',
  AuthStepEnum.waitingForInput: 'WAITING_FOR_INPUT',
  AuthStepEnum.contactingApple: 'CONTACTING_APPLE',
  AuthStepEnum.contactingGoogle: 'CONTACTING_GOOGLE',
  AuthStepEnum.signingInWithFirebase: 'SIGNING_IN_WITH_FIREBASE',
  AuthStepEnum.signingOut: 'SIGNING_OUT',
};
