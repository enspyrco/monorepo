import 'package:flireator/actions/auth/retrieve_flireator_data.dart';
import 'package:flireator/actions/auth/sign_in_with_apple.dart';
import 'package:flireator/actions/auth/store_sign_in_step.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:redux/redux.dart';

class SignInWithAppleMiddleware
    extends TypedMiddleware<AppState, SignInWithApple> {
  SignInWithAppleMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          // the service will update the sign in step as it goes
          final userData = await authService.signInWithApple();

          if (userData == null) return;

          store.dispatch(
              StoreSignInStep(step: SignInStep.retrievingFlireatorData));
          store.dispatch(RetrieveFlireatorData(userId: userData.uid));
        });
}
