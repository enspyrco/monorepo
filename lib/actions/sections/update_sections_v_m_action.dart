import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'update_sections_v_m_action.freezed.dart';
part 'update_sections_v_m_action.g.dart';

@freezed
class UpdateSectionsVMAction with _$UpdateSectionsVMAction, ReduxAction {
  factory UpdateSectionsVMAction({required bool creatingNewSection}) =
      _UpdateSectionsVMAction;

  factory UpdateSectionsVMAction.fromJson(Map<String, dynamic> json) =>
      _$UpdateSectionsVMActionFromJson(json);
}
