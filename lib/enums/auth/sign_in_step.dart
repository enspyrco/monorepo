import 'package:freezed_annotation/freezed_annotation.dart';

enum SignInStep {
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
  @JsonValue('RETRIEVING_FLIREATOR_DATA')
  retrievingFlireatorData,
  @JsonValue('SIGNING_OUT')
  signingOut
}
