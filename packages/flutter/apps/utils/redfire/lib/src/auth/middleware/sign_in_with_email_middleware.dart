import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';
import '../../utils/red_fire_locator.dart';
import '../actions/email/sign_in_with_email_action.dart';
import '../actions/reset_auth_page_action.dart';
import '../actions/set_auth_step_action.dart';

class SignInWithEmailMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignInWithEmailAction> {
  SignInWithEmailMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getAuthService();

            var email = store.state.auth.emailVM.email!;

            store.dispatch(
                const SetAuthStepAction(AuthStepEnum.signingInWithFirebase));

            await service.signInWithEmailAndPassword(email, action.password);

            store.dispatch(const ResetAuthPageAction());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
