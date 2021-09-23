import 'package:redfire/src/redux/extensions/store_extensions.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../../../actions.dart';

class SignInWithAppleMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignInWithAppleAction> {
  SignInWithAppleMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final authService = RedFireLocator.getAuthService();

            store.dispatch(SetAuthStepAction.contactingApple());

            final appleIdCredential = await authService.getAppleCredential();

            store.dispatch(SetAuthStepAction.signingInWithFirebase());

            // We don't do anyting with the UserData object here as the
            // authStateChanges stream will emit the same object and the state is
            // changed there.
            final authUserData = await authService.signInWithApple(
                credential: appleIdCredential);

            store.dispatch(SetAuthUserDataAction(authUserData));
            store.dispatch(SetAuthStepAction.waitingForInput());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
