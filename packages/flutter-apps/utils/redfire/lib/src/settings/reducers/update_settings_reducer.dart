import 'package:redux/redux.dart';

import '../../types/red_fire_state.dart';
import '../actions/update_settings_action.dart';

class UpdateSettingsReducer<T extends RedFireState>
    extends TypedReducer<T, UpdateSettingsAction> {
  UpdateSettingsReducer()
      : super((state, action) => (state as dynamic)
            .copyWith
            .settings(platform: action.platform) as T);
}
