import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'create_section_action.freezed.dart';
part 'create_section_action.g.dart';

@freezed
class CreateSectionAction with _$CreateSectionAction, ReduxAction {
  factory CreateSectionAction() = _CreateSectionAction;

  factory CreateSectionAction.fromJson(Map<String, dynamic> json) =>
      _$CreateSectionActionFromJson(json);
}
