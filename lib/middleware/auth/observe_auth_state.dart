import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/observe_auth_state_action.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';

class ObserveAuthStateMiddleware
    extends TypedMiddleware<AppState, ObserveAuthStateAction> {
  ObserveAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          try {
            authService.connectAuthStateToStore();
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
