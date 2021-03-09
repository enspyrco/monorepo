import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'observe_auth_state_action.freezed.dart';
part 'observe_auth_state_action.g.dart';

@freezed
class ObserveAuthStateAction with _$ObserveAuthStateAction, ReduxAction {
  factory ObserveAuthStateAction() = _ObserveAuthStateAction;

  factory ObserveAuthStateAction.fromJson(Map<String, dynamic> json) =>
      _$ObserveAuthStateActionFromJson(json);
}
