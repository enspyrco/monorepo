import 'package:redfire/src/settings/actions/update_settings_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class UpdateSettingsReducer<T extends RedFireState>
    extends TypedReducer<T, UpdateSettingsAction> {
  UpdateSettingsReducer()
      : super((state, action) => (state as dynamic)
            .copyWith
            .settings(platform: action.platform) as T);
}
