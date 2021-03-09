import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'update_new_section_v_m_action.freezed.dart';
part 'update_new_section_v_m_action.g.dart';

@freezed
class UpdateNewSectionVMAction with _$UpdateNewSectionVMAction, ReduxAction {
  factory UpdateNewSectionVMAction({String? name}) = _UpdateNewSectionVMAction;

  factory UpdateNewSectionVMAction.fromJson(Map<String, dynamic> json) =>
      _$UpdateNewSectionVMActionFromJson(json);
}
