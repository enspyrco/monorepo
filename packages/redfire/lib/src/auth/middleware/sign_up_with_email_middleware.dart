import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/actions/email/sign_up_with_email_action.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';

class SignUpWithEmailMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignUpWithEmailAction> {
  SignUpWithEmailMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getAuthService();

            var email = store.state.auth.emailVM.email!;

            store.dispatch(
                const SetAuthStepAction(AuthStepEnum.signingInWithFirebase));

            await service.signUpWithEmailAndPassword(email, action.password);

            store.dispatch(
                const SetAuthStepAction(AuthStepEnum.waitingForInput));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
