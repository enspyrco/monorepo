import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils.dart';
import '../auth/services/auth_service.dart';
import '../database/services/firestore_service_flutterfire.dart';
import '../networking/services/http_service.dart';
import '../platform/plugins/wrappers/apple_signin_wrapper.dart';
import '../platform/services/platform_service.dart';
import '../types/redux_action.dart';

class RedFireLocator {
  ////////////////////////////////////////////////////
  /// Config
  ////////////////////////////////////////////////////

  static RedFireConfig getConfig() => _config!;
  static void provideConfig(RedFireConfig config) => _config = config;

  ////////////////////////////////////////////////////
  /// Services
  ////////////////////////////////////////////////////
  // TODO: fix this - we only need to create a service once, not every time get... is called
  // --> Change ?? to ??= and write a test
  static AuthService getAuthService() =>
      _authService ??
      // Create an AuthService with only the relevant auth providers
      AuthService(
          firebase: FirebaseAuth.instance,
          google: (kIsWeb || Platform.isAndroid)
              ? GoogleSignIn(
                  scopes: <String>['email'], clientId: _config?.auth.clientId)
              : null,
          apple:
              (kIsWeb || Platform.isAndroid) ? null : SignInWithAppleWrapper());
  static FirestoreServiceFlutterfire getFirestoreService() =>
      _firestoreService ?? FirestoreServiceFlutterfire();
  static PlatformService getPlatformService() =>
      _platformService ?? PlatformService();
  static HttpService getHttpService() => _httpService ?? HttpService();
  static List<ReduxAction> get getOnSignInActions => _onSignInActions ?? [];

  // Provide one or more
  static void provide(
      {AuthService? authService,
      FirestoreServiceFlutterfire? firestoreService,
      PlatformService? platformService,
      HttpService? httpService}) {
    _authService = authService;
    _firestoreService = firestoreService;
    _platformService = platformService;
    _httpService = httpService;
  }

  static void provideAll(
      {required AuthService authService,
      required FirestoreServiceFlutterfire firestoreService,
      required PlatformService platformService,
      required HttpService httpService}) {
    _authService = authService;
    _firestoreService = firestoreService;
    _platformService = platformService;
    _httpService = httpService;
  }

  static void provideOnSignInActions(List<ReduxAction>? onSignInActions) =>
      _onSignInActions = onSignInActions;

  static RedFireConfig? _config;
  static AuthService? _authService;
  static FirestoreServiceFlutterfire? _firestoreService;
  static PlatformService? _platformService;
  static HttpService? _httpService;
  static List<ReduxAction>? _onSignInActions;

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
