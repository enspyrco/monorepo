import 'package:flireator/actions/auth/sign_out.dart';
import 'package:flireator/actions/auth/store_auth_step.dart';
import 'package:flireator/enums/auth/auth_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class SignOutMiddleware extends TypedMiddleware<AppState, SignOut> {
  SignOutMiddleware(AuthService authService, NavigationService navigatonService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'SignOutMiddleware');

          try {
            // set the auth step and use the service to sign out
            store.dispatch(StoreAuthStep(step: AuthStep.signingOut));
            await authService.signOut();
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
