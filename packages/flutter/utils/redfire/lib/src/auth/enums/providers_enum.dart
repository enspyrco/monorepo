import 'package:json_annotation/json_annotation.dart';

enum ProvidersEnum {
  @JsonValue('APPLE')
  apple,
  @JsonValue('GOOGLE')
  google,
  @JsonValue('EMAIL')
  email,
  @JsonValue('GIT_HUB')
  gitHub,
}
