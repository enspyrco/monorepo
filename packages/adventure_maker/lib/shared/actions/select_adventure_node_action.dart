import 'package:adventure_maker/shared/models/adventure_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'select_adventure_node_action.freezed.dart';
part 'select_adventure_node_action.g.dart';

@freezed
class SelectAdventureNodeAction with _$SelectAdventureNodeAction, ReduxAction {
  const SelectAdventureNodeAction._();
  const factory SelectAdventureNodeAction(
          @AdventureNodeConverter() AdventureNode selection) =
      _SelectAdventureNodeAction;

  factory SelectAdventureNodeAction.fromJson(JsonMap json) =>
      _$SelectAdventureNodeActionFromJson(json);

  @override
  String get typeName => 'SelectAdventureNodeAction';
}
