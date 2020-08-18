import 'package:flireator/actions/auth/sign_in_with_apple.dart';
import 'package:flireator/actions/auth/store_auth_step.dart';
import 'package:flireator/enums/auth/auth_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/models/flireator/credential_info.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:redux/redux.dart';

class SignInWithAppleMiddleware
    extends TypedMiddleware<AppState, SignInWithApple> {
  SignInWithAppleMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(StoreAuthStep(step: AuthStep.signingInWithApple));
          final userData = await authService.signInWithApple();
          await databaseService.offerUserInfo(userData);

          final appleProvider = userData.providers
              .firstWhere((provider) => provider.providerId == 'apple.com');
          await databaseService.offerCredential(
              userData.uid,
              'apple',
              CredentialInfo(
                  uid: appleProvider.uid,
                  token: null,
                  displayName: appleProvider.displayName,
                  photoURL: appleProvider.photoUrl));
        });
}
