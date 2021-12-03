import 'package:adventure_maker/adventures/actions/set_selected_adventure_action.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:redux/redux.dart';

class SetSelectedAdventureReducer
    extends TypedReducer<AppState, SetSelectedAdventureAction> {
  SetSelectedAdventureReducer()
      : super((state, action) =>
            state.copyWith.adventures(selected: action.selection));
}
