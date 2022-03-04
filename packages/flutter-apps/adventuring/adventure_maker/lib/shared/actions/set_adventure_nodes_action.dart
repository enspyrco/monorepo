import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'set_adventure_nodes_action.freezed.dart';
part 'set_adventure_nodes_action.g.dart';

@freezed
class SetAdventureNodesAction with _$SetAdventureNodesAction, ReduxAction {
  static const String className = 'SetAdventureNodesAction';

  const SetAdventureNodesAction._();
  const factory SetAdventureNodesAction(ISet list) = _SetAdventureNodesAction;

  factory SetAdventureNodesAction.fromJson(JsonMap json) =>
      _$SetAdventureNodesActionFromJson(json);

  @override
  String get typeName => className;
}
