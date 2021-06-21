import 'package:redfire/actions.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/utils/locator.dart';
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
