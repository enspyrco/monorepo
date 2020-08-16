import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class ServicesBundle {
  /// Services
  final AuthService _authService;
  final DatabaseService _databaseService;
  final PlatformService _platformService;
  final NavigationService _navigationService;

  ServicesBundle({
    @required GlobalKey<NavigatorState> navKey,
    AuthService authService,
    DatabaseService databaseService,
    PlatformService platformService,
    NavigationService navigationService,
  })  : _authService = authService ??
            FirebaseAuthService(
                FirebaseAuth.instance, StreamController<ReduxAction>()),
        _databaseService =
            databaseService ?? FirestoreService(Firestore.instance),
        _platformService = platformService ?? PlatformService(),
        _navigationService = navigationService ?? NavigationService(navKey),
        _gitHubService = gitHubService ?? GitHubService();

  AuthService get auth => _authService;
  DatabaseService get database => _databaseService;
  PlatformService get platform => _platformService;
  NavigationService get navigation => _navigationService;
  GitHubService get gitHub => _gitHubService;
}
