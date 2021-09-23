import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/actions/get_id_token_action.dart';
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

            // Listen to the stream that emits actions on any auth change
            // and call dispatch on the action.
            authService.streamOfSetAuthUserData.listen((action) {
              try {
                store.dispatch(action);

                // If signing in, dispatch an action to get an id token.
                // The logic is here in order to cover both signing in explicitly
                // and when returning to the app already signed in.
                if (action.authUserData != null) {
                  store.dispatch(GetIdTokenAction());
                }
              } catch (error, trace) {
                store.dispatchProblem(error, trace);
              }
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
