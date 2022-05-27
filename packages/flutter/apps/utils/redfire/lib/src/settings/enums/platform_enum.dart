import 'package:freezed_annotation/freezed_annotation.dart';

enum PlatformsEnum {
  @JsonValue('WEB')
  web,
  @JsonValue('ANDROID')
  android,
  @JsonValue('IOS')
  iOS,
  @JsonValue('MACOS')
  macOS,
  @JsonValue('FUCHSIA')
  fuchsia,
  @JsonValue('LINUX')
  linux,
  @JsonValue('WINDOWS')
  windows,
  @JsonValue('UNKNOWN')
  unknown,
}
