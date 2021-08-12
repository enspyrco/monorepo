import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'update_new_project_section_v_m_action.freezed.dart';
part 'update_new_project_section_v_m_action.g.dart';

@freezed
class UpdateNewProjectSectionVMAction
    with _$UpdateNewProjectSectionVMAction, ReduxAction {
  factory UpdateNewProjectSectionVMAction({String? name}) =
      _UpdateNewProjectSectionVMAction;

  factory UpdateNewProjectSectionVMAction.fromJson(Map<String, dynamic> json) =>
      _$UpdateNewProjectSectionVMActionFromJson(json);
}
