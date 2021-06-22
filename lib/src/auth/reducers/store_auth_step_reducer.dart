import 'package:redfire/src/auth/actions/store_auth_step_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class StoreAuthStepReducer<T extends RedFireState>
    extends TypedReducer<T, StoreAuthStepAction> {
  StoreAuthStepReducer()
      : super(
          (state, action) =>
              (state as dynamic).copyWith.auth(step: action.step) as T,
        );
}
