import 'package:freezed_annotation/freezed_annotation.dart';

enum DatabaseSectionEnum {
  @JsonValue('PROFILE_DATA')
  profileData,
  @JsonValue('NEW_ENTRIES')
  newEntries,
  @JsonValue('SECTIONS')
  sections,
}
