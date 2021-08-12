import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/models/project_sections/project_section.dart';

part 'project_sections_v_m.freezed.dart';
part 'project_sections_v_m.g.dart';

@freezed
class ProjectSectionsVM with _$ProjectSectionsVM {
  ProjectSectionsVM._();
  factory ProjectSectionsVM({
    required String newName,
    required IList<ProjectSection> list,
    required bool creatingNewSection,
  }) = _ProjectSectionsVM;

  factory ProjectSectionsVM.fromJson(Map<String, dynamic> json) =>
      _$ProjectSectionsVMFromJson(json);

  factory ProjectSectionsVM.init() => ProjectSectionsVM(
      list: <ProjectSection>[].lock, newName: '', creatingNewSection: false);
}
