import 'package:freezed_annotation/freezed_annotation.dart';

enum ProvidersEnum {
  @JsonValue('GOOGLE')
  google,
  @JsonValue('ASANA')
  asana,
  @JsonValue('GIT_HUB')
  gitHub,
}
