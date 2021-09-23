import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redfire/src/auth/services/auth_service.dart';
import 'package:redfire/src/database/services/database_service.dart';
import 'package:redfire/src/networking/services/http_service.dart';
import 'package:redfire/src/platform/plugins/wrappers/apple_signin_wrapper.dart';
import 'package:redfire/src/platform/services/platform_service.dart';

class RedFireLocator {
  ////////////////////////////////////////////////////
  /// Services
  ////////////////////////////////////////////////////
  // TODO: fix this - we only need to create a service once, not every time get... is called
  static AuthService getAuthService() =>
      _authService ??
      // Create an AuthService with only the relevant auth providers
      AuthService(
          firebase: FirebaseAuth.instance,
          google: (kIsWeb || Platform.isAndroid)
              ? GoogleSignIn(scopes: <String>['email'])
              : null,
          apple:
              (kIsWeb || Platform.isAndroid) ? null : SignInWithAppleWrapper());
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

  ////////////////////////////////////////////////////
  /// Controllers
  ////////////////////////////////////////////////////

  static void provideEmailTextFieldController(
      TextEditingController? controller) {
    _emailTextFieldController = controller;
  }

  static TextEditingController? getEmailTextFieldController() =>
      _emailTextFieldController;

  static TextEditingController? _emailTextFieldController;
}
