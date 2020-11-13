import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/sign_out.dart';
import 'package:the_process/actions/auth/store_auth_step.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';

class SignOutMiddleware extends TypedMiddleware<AppState, SignOut> {
  SignOutMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          try {
            // set the auth step and use the service to sign out
            store.dispatch(StoreAuthStep(step: AuthStep.signingOut));
            await authService.signOut();
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
