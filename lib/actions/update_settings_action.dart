import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/settings/enums/platform_enum.dart';
import 'package:redfire/types/redux_action.dart';

part 'update_settings_action.freezed.dart';
part 'update_settings_action.g.dart';

@freezed
class UpdateSettingsAction with _$UpdateSettingsAction, ReduxAction {
  factory UpdateSettingsAction({required PlatformEnum platform}) =
      _UpdateSettingsAction;

  factory UpdateSettingsAction.fromJson(Map<String, dynamic> json) =>
      _$UpdateSettingsActionFromJson(json);
}
