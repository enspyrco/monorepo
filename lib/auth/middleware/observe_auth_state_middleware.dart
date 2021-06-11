import 'package:redfire/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/types/red_fire_state.dart';
import 'package:redfire/utils/locator.dart';
import 'package:redux/redux.dart';

class ObserveAuthStateMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, ObserveAuthStateAction> {
  ObserveAuthStateMiddleware()
      : super((store, action, next) async {
          next(action);

          final authService = Locator.getAuthService();

          // listen to the stream that emits actions on any auth change
          // and call dispatch on the action
          authService.streamOfStateChanges.listen(store.dispatch);
        });
}
