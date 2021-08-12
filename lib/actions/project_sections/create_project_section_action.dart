import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_project_section_action.freezed.dart';
part 'create_project_section_action.g.dart';

@freezed
class CreateProjectSectionAction
    with _$CreateProjectSectionAction, ReduxAction {
  factory CreateProjectSectionAction() = _CreateProjectSectionAction;

  factory CreateProjectSectionAction.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectSectionActionFromJson(json);
}
