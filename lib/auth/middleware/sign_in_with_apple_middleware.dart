import 'package:redfire/auth/actions/sign_in_with_apple_action.dart';
import 'package:redfire/auth/actions/store_auth_step_action.dart';
import 'package:redfire/auth/actions/store_auth_user_data_action.dart';
import 'package:redfire/redux/extensions/store_extensions.dart';
import 'package:redfire/types/red_fire_state.dart';
import 'package:redfire/utils/locator.dart';
import 'package:redux/redux.dart';

class SignInWithAppleMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignInWithAppleAction> {
  SignInWithAppleMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final authService = Locator.getAuthService();

            store.dispatch(StoreAuthStepAction.contactingApple());

            final appleIdCredential = await authService.getAppleCredential();

            store.dispatch(StoreAuthStepAction.signingInWithFirebase());

            // We don't do anyting with the UserData object here as the
            // authStateChanges stream will emit the same object and the state is
            // changed there.
            final authUserData = await authService.signInWithApple(
                credential: appleIdCredential);

            store.dispatch(StoreAuthUserDataAction(authUserData));
            store.dispatch(StoreAuthStepAction.waitingForInput());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
