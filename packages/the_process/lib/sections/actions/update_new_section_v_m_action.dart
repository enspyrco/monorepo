import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'update_new_section_v_m_action.freezed.dart';
part 'update_new_section_v_m_action.g.dart';

@freezed
class UpdateNewSectionVMAction with _$UpdateNewSectionVMAction, ReduxAction {
  UpdateNewSectionVMAction._();
  factory UpdateNewSectionVMAction({String? name}) = _UpdateNewSectionVMAction;

  factory UpdateNewSectionVMAction.fromJson(JsonMap json) =>
      _$UpdateNewSectionVMActionFromJson(json);

  @override
  String get typeName => 'UpdateNewSectionVMAction';
}
