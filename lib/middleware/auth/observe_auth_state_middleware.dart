import 'package:flireator/actions/auth/observe_auth_state_action.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class ObserveAuthStateMiddleware
    extends TypedMiddleware<AppState, ObserveAuthStateAction> {
  ObserveAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'ObserveAuthStateMiddleware');

          try {
            authService.connectAuthStateToStore();
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
