import 'package:freezed_annotation/freezed_annotation.dart';

enum AuthorizationStep {
  @JsonValue('WAITING_FOR_INPUT')
  waitingForInput,
  @JsonValue('GETTING_AUTHORIZED')
  gettingAuthorized,
  @JsonValue('AUTHORIZED')
  authorized,
  @JsonValue('UNKOWN')
  unknown,
}
