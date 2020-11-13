import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/observe_auth_state.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';

class ObserveAuthStateMiddleware
    extends TypedMiddleware<AppState, ObserveAuthState> {
  ObserveAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // Any exceptions are added to the stream going to the store.
          authService.connectAuthStateToStore();
        });
}
