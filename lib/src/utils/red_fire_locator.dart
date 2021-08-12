import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redfire/src/auth/services/auth_service.dart';
import 'package:redfire/src/database/services/database_service.dart';
import 'package:redfire/src/networking/services/http_service.dart';
import 'package:redfire/src/platform/plugins/wrappers/apple_signin_wrapper.dart';
import 'package:redfire/src/platform/services/platform_service.dart';

class RedFireLocator {
  static AuthService getAuthService() =>
      _authService ??
      AuthService(FirebaseAuth.instance,
          GoogleSignIn(scopes: <String>['email']), AppleSignInWrapper());
  static DatabaseService getDatabaseService() =>
      _databaseService ?? DatabaseService();
  static PlatformService getPlatformService() =>
      _platformService ?? PlatformService();
  static HttpService getHttpService() => _httpService ?? HttpService();

  // Provide one or more
  static void provide(
      {AuthService? authService,
      DatabaseService? databaseService,
      PlatformService? platformService,
      HttpService? httpService}) {
    _authService = authService;
    _databaseService = databaseService;
    _platformService = platformService;
    _httpService = httpService;
  }

  static void provideAll(
      {required AuthService authService,
      required DatabaseService databaseService,
      required PlatformService platformService,
      required HttpService httpService}) {
    _authService = authService;
    _databaseService = databaseService;
    _platformService = platformService;
    _httpService = httpService;
  }

  static AuthService? _authService;
  static DatabaseService? _databaseService;
  static PlatformService? _platformService;
  static HttpService? _httpService;
}
