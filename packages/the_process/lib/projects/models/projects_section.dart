import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/projects/models/project_model.dart';

part 'projects_section.freezed.dart';
part 'projects_section.g.dart';

@freezed
class ProjectsSection with _$ProjectsSection, ReduxModel {
  const factory ProjectsSection({
    required ISet<ProjectModel> all,
    required bool creating,
  }) = _ProjectsSection;

  factory ProjectsSection.fromJson(JsonMap json) =>
      _$ProjectsSectionFromJson(json);

  factory ProjectsSection.init() =>
      ProjectsSection(all: ISet(const {}), creating: false);
}
