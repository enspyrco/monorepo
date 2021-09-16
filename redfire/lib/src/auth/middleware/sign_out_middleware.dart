import 'package:redfire/src/auth/actions/set_auth_step_action.dart';
import 'package:redfire/src/auth/actions/sign_out_action.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../../redux/extensions/store_extensions.dart';

class SignOutMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignOutAction> {
  SignOutMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final authService = RedFireLocator.getAuthService();

            // set the auth step and use the service to sign out
            store.dispatch(SetAuthStepAction(AuthStepEnum.signingOut));
            await authService
                .signOut(store.state.auth.idTokenResult?.signInProvider);
            store.dispatch(SetAuthStepAction(AuthStepEnum.waitingForInput));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
