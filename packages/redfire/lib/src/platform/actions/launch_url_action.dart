import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'launch_url_action.freezed.dart';
part 'launch_url_action.g.dart';

@freezed
class LaunchUrlAction with _$LaunchUrlAction, ReduxAction {
  const LaunchUrlAction._();
  const factory LaunchUrlAction({required String url}) = _LaunchUrlAction;

  factory LaunchUrlAction.fromJson(JsonMap json) =>
      _$LaunchUrlActionFromJson(json);

  @override
  String get typeName => 'LaunchUrlAction';
}
