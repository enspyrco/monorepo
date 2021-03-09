import 'package:redux/redux.dart';
import 'package:the_process/actions/settings/update_settings_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

class UpdateSettingsReducer
    extends TypedReducer<AppState, UpdateSettingsAction> {
  UpdateSettingsReducer()
      : super((state, action) =>
            state.copyWith.settings(platform: action.platform));
}
