import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'update_project_sections_v_m_action.freezed.dart';
part 'update_project_sections_v_m_action.g.dart';

@freezed
class UpdateProjectSectionsVMAction
    with _$UpdateProjectSectionsVMAction, ReduxAction {
  factory UpdateProjectSectionsVMAction({required bool creatingNewSection}) =
      _UpdateProjectSectionsVMAction;

  factory UpdateProjectSectionsVMAction.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectSectionsVMActionFromJson(json);
}
