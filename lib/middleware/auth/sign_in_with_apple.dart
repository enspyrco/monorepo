import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/sign_in_with_apple_action.dart';
import 'package:the_process/actions/auth/store_auth_step_action.dart';
import 'package:the_process/actions/auth/store_auth_user_data_action.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';

class SignInWithAppleMiddleware
    extends TypedMiddleware<AppState, SignInWithAppleAction> {
  SignInWithAppleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(StoreAuthStepAction(step: AuthStep.contactingApple));

          final appleIdCredential = await authService.getAppleCredential();

          store.dispatch(
              StoreAuthStepAction(step: AuthStep.signingInWithFirebase));

          // We don't do anyting with the UserData object here as the
          // authStateChanges stream will emit the same object and the state is
          // changed there.
          final authUserData =
              await authService.signInWithApple(credential: appleIdCredential);

          store.dispatch(StoreAuthUserDataAction(authUserData: authUserData));
          store.dispatch(StoreAuthStepAction(step: AuthStep.waitingForInput));
        });
}
