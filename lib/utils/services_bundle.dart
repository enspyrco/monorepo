import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/auth/firebase_auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:flireator/services/database/firestore_service.dart';
import 'package:flireator/services/navigation_service.dart';
import 'package:flireator/services/platform_service.dart';
import 'package:flutter/widgets.dart';

class ServicesBundle {
  /// Services
  final AuthService _authService;
  final DatabaseService _databaseService;
  final PlatformService _platformService;
  final NavigationService _navigationService;

  ServicesBundle({
    required GlobalKey<NavigatorState> navKey,
    AuthService? authService,
    DatabaseService? databaseService,
    PlatformService? platformService,
    NavigationService? navigationService,
  })  : _authService = authService ??
            FirebaseAuthService(
                FirebaseAuth.instance, StreamController<ReduxAction>()),
        _databaseService =
            databaseService ?? FirestoreService(FirebaseFirestore.instance),
        _platformService = platformService ?? PlatformService(),
        _navigationService = navigationService ?? NavigationService(navKey);

  AuthService get auth => _authService;
  DatabaseService get database => _databaseService;
  PlatformService get platform => _platformService;
  NavigationService get navigation => _navigationService;
}
