import 'package:freezed_annotation/freezed_annotation.dart';

import '../../types/redux_action.dart';
import '../../types/typedefs.dart';

part 'observe_auth_state_action.freezed.dart';
part 'observe_auth_state_action.g.dart';

@freezed
class ObserveAuthStateAction with _$ObserveAuthStateAction, ReduxAction {
  const ObserveAuthStateAction._();
  const factory ObserveAuthStateAction() = _ObserveAuthStateAction;

  factory ObserveAuthStateAction.fromJson(JsonMap json) =>
      _$ObserveAuthStateActionFromJson(json);

  @override
  String get typeName => 'ObserveAuthStateAction';
}
