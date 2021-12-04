import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_adventure_node_action.freezed.dart';
part 'create_adventure_node_action.g.dart';

@freezed
class CreateAdventureNodeAction with _$CreateAdventureNodeAction, ReduxAction {
  const CreateAdventureNodeAction._();
  const factory CreateAdventureNodeAction(String name) =
      _CreateAdventureNodeAction;

  factory CreateAdventureNodeAction.fromJson(JsonMap json) =>
      _$CreateAdventureNodeActionFromJson(json);

  @override
  String get typeName => 'CreateAdventureNodeAction';
}
