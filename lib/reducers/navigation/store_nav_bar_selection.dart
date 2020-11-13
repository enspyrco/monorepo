import 'package:redux/redux.dart';
import 'package:the_process/actions/navigation/store_nav_bar_selection.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreNavBarSelectionReducer
    extends TypedReducer<AppState, StoreNavBarSelection> {
  StoreNavBarSelectionReducer()
      : super((state, action) =>
            state.rebuild((b) => b..navSelection = action.selection));
}
