import 'package:redux/redux.dart';
import 'package:the_process/actions/settings/update_settings.dart';
import 'package:the_process/models/app_state/app_state.dart';

class UpdateSettingsReducer extends TypedReducer<AppState, UpdateSettings> {
  UpdateSettingsReducer()
      : super((state, action) =>
            state.rebuild((b) => b..settings.platform = action.platform));
}
