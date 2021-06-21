import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redfire/src/auth/services/auth_service.dart';
import 'package:redfire/src/platform/platform_service.dart';
import 'package:redfire/src/platform/plugins/wrappers/apple_signin_wrapper.dart';

class Locator {
  static AuthService getAuthService() =>
      _authService ??
      AuthService(FirebaseAuth.instance,
          GoogleSignIn(scopes: <String>['email']), AppleSignInWrapper());
  static PlatformService getPlatformService() =>
      _platformService ?? PlatformService();

  static void provide(
      AuthService authService, PlatformService platformService) {
    _authService = authService;
    _platformService = platformService;
  }

  static AuthService? _authService;
  static PlatformService? _platformService;
}
