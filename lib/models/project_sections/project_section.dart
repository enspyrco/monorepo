import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'project_section.freezed.dart';
part 'project_section.g.dart';

@freezed
class ProjectSection with _$ProjectSection {
  factory ProjectSection({
    required String name,
    required String folderId,
    required String useCasesDocId,
  }) = _ProjectSection;

  factory ProjectSection.fromJson(JsonMap json) =>
      _$ProjectSectionFromJson(json);
}
