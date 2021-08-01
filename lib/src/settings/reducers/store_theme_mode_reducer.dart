import 'package:redfire/src/settings/actions/store_theme_mode_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class StoreThemeModeReducer<T extends RedFireState>
    extends TypedReducer<T, StoreThemeModeAction> {
  StoreThemeModeReducer()
      : super(
          (state, action) =>
              (state as dynamic).copyWith(themeMode: action.themeMode) as T,
        );
}
