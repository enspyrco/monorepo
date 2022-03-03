import 'package:freezed_annotation/freezed_annotation.dart';

import '../../types/redux_action.dart';
import '../../types/typedefs.dart';
import '../enums/platform_enum.dart';

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
