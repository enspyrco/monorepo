import 'package:redux/redux.dart';

import '../../types/red_fire_state.dart';
import '../actions/set_auth_step_action.dart';

class SetAuthStepReducer<T extends RedFireState>
    extends TypedReducer<T, SetAuthStepAction> {
  SetAuthStepReducer()
      : super(
          (state, action) =>
              (state as dynamic).copyWith.auth(step: action.step) as T,
        );
}
