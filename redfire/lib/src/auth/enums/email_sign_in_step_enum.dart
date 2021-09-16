import 'package:json_annotation/json_annotation.dart';

enum EmailSignInStepEnum {
  @JsonValue('WAITING_FOR_EMAIL')
  waitingForEmail,
  @JsonValue('CHECKING_EMAIL')
  checkingEmail,
  @JsonValue('WAITING_FOR_SIGN_UP_PASSWORD')
  waitingForSignUpPassword,
  @JsonValue('WAITING_FOR_SIGN_IN_PASSWORD')
  waitingForSignInPassword,
}
