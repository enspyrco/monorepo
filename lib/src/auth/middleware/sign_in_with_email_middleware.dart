import 'package:redfire/src/auth/actions/email/sign_in_with_email_action.dart';
import 'package:redfire/src/auth/actions/store_auth_step_action.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';

class SignInWithEmailMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignInWithEmailAction> {
  SignInWithEmailMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getAuthService();

            var email = store.state.auth.email!;

            store.dispatch(
                StoreAuthStepAction(AuthenticationEnum.signingInWithFirebase));

            await service.signInWithEmailAndPassword(email, action.password);

            store.dispatch(
                StoreAuthStepAction(AuthenticationEnum.waitingForInput));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
