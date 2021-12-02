import 'package:adventure_maker/models/adventure_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'set_selected_adventure_action.freezed.dart';
part 'set_selected_adventure_action.g.dart';

@freezed
class SetSelectedAdventureAction
    with _$SetSelectedAdventureAction, ReduxAction {
  const SetSelectedAdventureAction._();
  const factory SetSelectedAdventureAction(AdventureModel selection) =
      _SetSelectedAdventureAction;

  factory SetSelectedAdventureAction.fromJson(JsonMap json) =>
      _$SetSelectedAdventureActionFromJson(json);

  @override
  String get typeName => 'SetSelectedAdventureAction';
}
