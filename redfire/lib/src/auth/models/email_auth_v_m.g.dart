// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_auth_v_m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmailAuthVM _$$_EmailAuthVMFromJson(Map<String, dynamic> json) =>
    _$_EmailAuthVM(
      email: json['email'] as String?,
      emailSignInStep: _$enumDecodeNullable(
              _$EmailSignInStepEnumEnumMap, json['emailSignInStep']) ??
          EmailSignInStepEnum.waitingForEmail,
    );

Map<String, dynamic> _$$_EmailAuthVMToJson(_$_EmailAuthVM instance) =>
    <String, dynamic>{
      'email': instance.email,
      'emailSignInStep': _$EmailSignInStepEnumEnumMap[instance.emailSignInStep],
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$EmailSignInStepEnumEnumMap = {
  EmailSignInStepEnum.waitingForEmail: 'WAITING_FOR_EMAIL',
  EmailSignInStepEnum.checkingEmail: 'CHECKING_EMAIL',
  EmailSignInStepEnum.waitingForSignUpPassword: 'WAITING_FOR_SIGN_UP_PASSWORD',
  EmailSignInStepEnum.waitingForSignInPassword: 'WAITING_FOR_SIGN_IN_PASSWORD',
};
