import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../redux/extensions/store_extensions.dart';
import '../../utils/red_fire_locator.dart';
import '../actions/set_auth_step_action.dart';
import '../actions/sign_out_action.dart';

class SignOutMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignOutAction> {
  SignOutMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final authService = RedFireLocator.getAuthService();

            // set the auth step and use the service to sign out
            store.dispatch(const SetAuthStepAction(AuthStepEnum.signingOut));
            await authService
                .signOut(store.state.auth.idTokenResult?.signInProvider);
            store.dispatch(
                const SetAuthStepAction(AuthStepEnum.waitingForInput));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
