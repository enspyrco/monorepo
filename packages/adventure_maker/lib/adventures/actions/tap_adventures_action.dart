import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_adventures_action.freezed.dart';
part 'tap_adventures_action.g.dart';

@freezed
class TapAdventuresAction with _$TapAdventuresAction, ReduxAction {
  const TapAdventuresAction._();
  const factory TapAdventuresAction({@Default(false) bool turnOff}) =
      _TapAdventuresAction;

  factory TapAdventuresAction.fromJson(JsonMap json) =>
      _$TapAdventuresActionFromJson(json);

  @override
  String get typeName => 'TapAdventuresAction';
}
