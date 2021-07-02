import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';

part 'tap_profile_action.freezed.dart';
part 'tap_profile_action.g.dart';

@freezed
class TapProfileAction with _$TapProfileAction, ReduxAction {
  factory TapProfileAction({@Default(false) bool turnOff}) = _TapProfileAction;

  factory TapProfileAction.fromJson(Map<String, Object?> json) =>
      _$TapProfileActionFromJson(json);
}
