import 'package:flireator/actions/auth/store_sign_in_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreSignInStepReducer extends TypedReducer<AppState, StoreSignInStep> {
  StoreSignInStepReducer()
      : super((state, action) =>
            state.rebuild((b) => b..signInStep = action.step));
}
