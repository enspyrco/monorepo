import 'package:redfire/src/auth/actions/sign_in_with_google_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/utils/locator.dart';
import 'package:redux/redux.dart';

class SignInWithGoogleMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SignInWithGoogleAction> {
  SignInWithGoogleMiddleware()
      : super((store, action, next) async {
          next(action);

          final authService = Locator.getAuthService();

          // signin and listen to the stream and dispatch actions
          authService.googleSignInStream.listen(store.dispatch);
        });
}
