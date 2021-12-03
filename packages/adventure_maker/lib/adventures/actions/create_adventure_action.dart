import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_adventure_action.freezed.dart';
part 'create_adventure_action.g.dart';

@freezed
class CreateAdventureAction with _$CreateAdventureAction, ReduxAction {
  const CreateAdventureAction._();
  const factory CreateAdventureAction(String name) = _CreateAdventureAction;

  factory CreateAdventureAction.fromJson(JsonMap json) =>
      _$CreateAdventureActionFromJson(json);

  @override
  String get typeName => 'CreateAdventureAction';
}
