import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/enums/platform/platform_enum.dart';

part 'update_settings_action.freezed.dart';
part 'update_settings_action.g.dart';

@freezed
class UpdateSettingsAction with _$UpdateSettingsAction, ReduxAction {
  factory UpdateSettingsAction({required PlatformEnum platform}) =
      _UpdateSettingsAction;

  factory UpdateSettingsAction.fromJson(Map<String, dynamic> json) =>
      _$UpdateSettingsActionFromJson(json);
}
