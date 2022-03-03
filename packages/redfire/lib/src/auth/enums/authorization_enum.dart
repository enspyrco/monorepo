import 'package:json_annotation/json_annotation.dart';

enum AuthorizationEnum {
  @JsonValue('WAITING_FOR_INPUT')
  waitingForInput,
  @JsonValue('GETTING_AUTHORIZED')
  gettingAuthorized,
  @JsonValue('AUTHORIZED')
  authorized,
  @JsonValue('UNKNOWN')
  unknown,
}
