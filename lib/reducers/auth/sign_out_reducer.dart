import 'package:flireator/actions/auth/sign_out_action.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class SignOutReducer extends TypedReducer<AppState, SignOutAction> {
  SignOutReducer()
      : super((state, action) => state.copyWith(
            gitHubToken: null, signInStep: SignInStep.signingOut));
}
