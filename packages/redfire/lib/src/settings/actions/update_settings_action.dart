import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/settings/enums/platform_enum.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'update_settings_action.freezed.dart';
part 'update_settings_action.g.dart';

@freezed
class UpdateSettingsAction with _$UpdateSettingsAction, ReduxAction {
  const UpdateSettingsAction._();
  const factory UpdateSettingsAction({required PlatformsEnum platform}) =
      _UpdateSettingsAction;

  factory UpdateSettingsAction.fromJson(JsonMap json) =>
      _$UpdateSettingsActionFromJson(json);

  @override
  String get typeName => 'UpdateSettingsAction';
}
