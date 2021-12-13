import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'project_model.dart';

part 'projects_section.freezed.dart';
part 'projects_section.g.dart';

@freezed
class ProjectsSection with _$ProjectsSection, ReduxState {
  static const String className = 'ProjectsSection';

  const ProjectsSection._();
  const factory ProjectsSection({
    required ISet<ProjectModel> all,
    required bool creating,
  }) = _ProjectsSection;

  factory ProjectsSection.fromJson(JsonMap json) =>
      _$ProjectsSectionFromJson(json);

  factory ProjectsSection.init() =>
      ProjectsSection(all: ISet(const {}), creating: false);

  @override
  String get typeName => className;
}
