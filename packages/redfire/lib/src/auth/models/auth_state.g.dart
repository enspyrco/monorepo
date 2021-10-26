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
      linking: LinkAccountsViewModel.fromJson(
          json['linking'] as Map<String, dynamic>),
      step: $enumDecode(_$AuthStepEnumEnumMap, json['step']),
    );

Map<String, dynamic> _$$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'emailVM': instance.emailVM,
      'userData': instance.userData,
      'idTokenResult': instance.idTokenResult,
      'linking': instance.linking,
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
