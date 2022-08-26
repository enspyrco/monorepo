import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../types/redux_action.dart';

part 'tap_profile_action.freezed.dart';
part 'tap_profile_action.g.dart';

@freezed
class TapProfileAction with _$TapProfileAction, ReduxAction {
  const TapProfileAction._();
  const factory TapProfileAction({@Default(false) bool turnOff}) =
      _TapProfileAction;

  factory TapProfileAction.fromJson(JsonMap json) =>
      _$TapProfileActionFromJson(json);

  @override
  String get typeName => 'TapProfileAction';
}
