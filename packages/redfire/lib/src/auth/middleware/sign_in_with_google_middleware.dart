import 'package:redux/redux.dart';

import '../../../actions.dart';
import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';
import '../../utils/red_fire_locator.dart';

class SignInWithGoogleMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignInWithGoogleAction> {
  SignInWithGoogleMiddleware()
      : super((store, action, next) async {
          next(action);

          final authService = RedFireLocator.getAuthService();

          try {
            store.dispatch(
                const SetAuthStepAction(AuthStepEnum.contactingGoogle));

            final credential = await authService.getGoogleCredential();

            // If user cancelled sign in, reset UI and return
            if (credential == null) {
              store.dispatch(
                  const SetAuthStepAction(AuthStepEnum.waitingForInput));
              return;
            }

            store.dispatch(
                const SetAuthStepAction(AuthStepEnum.signingInWithFirebase));

            // The authStateChanges stream will emit the same AuthUserData and
            // we are already listening to that stream and updating the app state
            // with whatever gets emitted.
            final authUserData =
                await authService.signInWithGoogle(credential: credential);

            store.dispatch(SetAuthUserDataAction(authUserData));
            store.dispatch(
                const SetAuthStepAction(AuthStepEnum.waitingForInput));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
