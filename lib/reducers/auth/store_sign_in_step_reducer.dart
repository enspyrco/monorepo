import 'package:flireator/actions/auth/store_sign_in_step_action.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreSignInStepReducer
    extends TypedReducer<AppState, StoreSignInStepAction> {
  StoreSignInStepReducer()
      : super((state, action) => state.copyWith(signInStep: action.step));
}
