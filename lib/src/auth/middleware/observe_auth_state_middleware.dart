import 'package:redfire/actions.dart';
import 'package:redfire/src/redux/extensions/store_extensions.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redux/redux.dart';

class ObserveAuthStateMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, ObserveAuthStateAction> {
  ObserveAuthStateMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final authService = RedFireLocator.getAuthService();

            // listen to the stream that emits actions on any auth change
            // and call dispatch on the action
            authService.streamOfStoreAuthState.listen((action) {
              store.dispatch(action);
            });
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
