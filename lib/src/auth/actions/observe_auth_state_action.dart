import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'observe_auth_state_action.freezed.dart';
part 'observe_auth_state_action.g.dart';

@freezed
class ObserveAuthStateAction with _$ObserveAuthStateAction, ReduxAction {
  factory ObserveAuthStateAction() = _ObserveAuthStateAction;

  factory ObserveAuthStateAction.fromJson(JsonMap json) =>
      _$ObserveAuthStateActionFromJson(json);
}
