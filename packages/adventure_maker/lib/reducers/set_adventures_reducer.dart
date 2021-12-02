import 'package:adventure_maker/actions/set_adventures_action.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:redux/redux.dart';

class SetAdventuresReducer extends TypedReducer<AppState, SetAdventuresAction> {
  SetAdventuresReducer()
      : super((state, action) {
          return state.copyWith.adventures(list: action.adventures);
        });
}
