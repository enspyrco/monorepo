import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';

part 'detect_platform_action.freezed.dart';
part 'detect_platform_action.g.dart';

@freezed
class DetectPlatformAction with _$DetectPlatformAction, ReduxAction {
  factory DetectPlatformAction() = _DetectPlatformAction;

  factory DetectPlatformAction.fromJson(Map<String, dynamic> json) =>
      _$DetectPlatformActionFromJson(json);
}
