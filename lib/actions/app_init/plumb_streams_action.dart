import 'package:flireator/actions/redux_action.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plumb_streams_action.freezed.dart';
part 'plumb_streams_action.g.dart';

@freezed
class PlumbStreamsAction with _$PlumbStreamsAction, ReduxAction {
  factory PlumbStreamsAction() = _PlumbStreamsAction;

  factory PlumbStreamsAction.fromJson(Map<String, dynamic> json) =>
      _$PlumbStreamsActionFromJson(json);
}
