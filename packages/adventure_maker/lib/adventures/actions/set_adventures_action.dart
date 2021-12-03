import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'set_adventures_action.freezed.dart';
part 'set_adventures_action.g.dart';

@freezed
class SetAdventuresAction with _$SetAdventuresAction, ReduxAction {
  const SetAdventuresAction._();
  const factory SetAdventuresAction(ISet<AdventureModel> adventures) =
      _SetAdventuresAction;

  factory SetAdventuresAction.fromJson(JsonMap json) =>
      _$SetAdventuresActionFromJson(json);

  @override
  String get typeName => 'SetAdventuresAction';
}
