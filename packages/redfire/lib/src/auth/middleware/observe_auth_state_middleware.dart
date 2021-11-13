import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/actions/get_id_token_action.dart';
import 'package:redfire/src/navigation/actions/pop_all_pages_action.dart';
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
            authService.streamOfSetAuthUserData.listen((setAuthUserDataAction) {
              try {
                store.dispatch(setAuthUserDataAction);

                // If signing in, dispatch an action to get an id token.
                // The logic is here in order to cover both signing in explicitly
                // and when returning to the app already signed in.
                if (setAuthUserDataAction.authUserData != null) {
                  store.dispatch(const GetIdTokenAction());
                  store.dispatch(const PopAllPagesAction());
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
