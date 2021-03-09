import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/sign_out_action.dart';
import 'package:the_process/actions/auth/store_auth_step_action.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';

class SignOutMiddleware extends TypedMiddleware<AppState, SignOutAction> {
  SignOutMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          try {
            // set the auth step and use the service to sign out
            store.dispatch(StoreAuthStepAction(step: AuthStep.signingOut));
            await authService.signOut();
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
