import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'tap_profile_action.freezed.dart';
part 'tap_profile_action.g.dart';

@freezed
class TapProfileAction with _$TapProfileAction, ReduxAction {
  TapProfileAction._();
  factory TapProfileAction({@Default(false) bool turnOff}) = _TapProfileAction;

  factory TapProfileAction.fromJson(JsonMap json) =>
      _$TapProfileActionFromJson(json);

  @override
  String get typeName => 'TapProfileAction';
}
