import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_section_action.freezed.dart';
part 'create_section_action.g.dart';

@freezed
class CreateSectionAction with _$CreateSectionAction, ReduxAction {
  CreateSectionAction._();
  factory CreateSectionAction() = _CreateSectionAction;

  factory CreateSectionAction.fromJson(JsonMap json) =>
      _$CreateSectionActionFromJson(json);

  @override
  String get typeName => 'CreateSectionAction';
}
