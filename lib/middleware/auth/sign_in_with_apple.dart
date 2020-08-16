import 'package:flireator/actions/auth/sign_in_with_apple.dart';
import 'package:flireator/actions/auth/store_auth_step.dart';
import 'package:flireator/enums/auth/auth_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:redux/redux.dart';

class SignInWithAppleMiddleware
    extends TypedMiddleware<AppState, SignInWithApple> {
  SignInWithAppleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // sign in anonymously
          store.dispatch(StoreAuthStep(step: AuthStep.signingInWithApple));
          await authService.signInWithApple();
        });
}
