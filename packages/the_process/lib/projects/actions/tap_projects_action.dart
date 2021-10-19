import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_projects_action.freezed.dart';
part 'tap_projects_action.g.dart';

@freezed
class TapProjectsAction with _$TapProjectsAction, ReduxAction {
  const factory TapProjectsAction({@Default(false) bool turnOff}) =
      _TapProjectsAction;

  factory TapProjectsAction.fromJson(JsonMap json) =>
      _$TapProjectsActionFromJson(json);
}
