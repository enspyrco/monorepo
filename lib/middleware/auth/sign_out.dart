import 'package:flireator/actions/auth/sign_out.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class SignOutMiddleware extends TypedMiddleware<AppState, SignOut> {
  SignOutMiddleware(
      AuthService authService, NavigationService navigationService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'SignOutMiddleware');

          try {
            await authService.signOut();
            navigationService.popHome();
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
