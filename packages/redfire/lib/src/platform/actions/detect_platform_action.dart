import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'detect_platform_action.freezed.dart';
part 'detect_platform_action.g.dart';

@freezed
class DetectPlatformAction with _$DetectPlatformAction, ReduxAction {
  const DetectPlatformAction._();
  const factory DetectPlatformAction() = _DetectPlatformAction;

  factory DetectPlatformAction.fromJson(JsonMap json) =>
      _$DetectPlatformActionFromJson(json);

  @override
  String get typeName => 'DetectPlatformAction';
}
