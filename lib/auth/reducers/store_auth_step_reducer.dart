import 'package:redfire/auth/actions/store_auth_step_action.dart';
import 'package:redfire/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class StoreAuthStepReducer<T extends RedFireState>
    extends TypedReducer<T, StoreAuthStepAction> {
  StoreAuthStepReducer()
      : super(
          (state, action) =>
              (state as dynamic).copyWith(authStep: action.step) as T,
        );
}
