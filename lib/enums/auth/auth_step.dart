import 'package:freezed_annotation/freezed_annotation.dart';

enum AuthStep {
  @JsonValue('CHECKING')
  checking,
  @JsonValue('WAITING_FOR_INPUT')
  waitingForInput,
  @JsonValue('CONTACTING_APPLE')
  contactingApple,
  @JsonValue('CONTACTING_GOOGLE')
  contactingGoogle,
  @JsonValue('SIGNING_IN_WITH_FIREBASE')
  signingInWithFirebase,
  @JsonValue('SIGNING_OUT')
  signingOut
}
