import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_adventure_part_action.freezed.dart';
part 'create_adventure_part_action.g.dart';

@freezed
class CreateAdventurePartAction with _$CreateAdventurePartAction, ReduxAction {
  const CreateAdventurePartAction._();
  const factory CreateAdventurePartAction(String name) =
      _CreateAdventurePartAction;

  factory CreateAdventurePartAction.fromJson(JsonMap json) =>
      _$CreateAdventurePartActionFromJson(json);

  @override
  String get typeName => 'CreateAdventurePartAction';
}
