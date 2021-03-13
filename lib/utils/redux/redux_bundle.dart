import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flireator/middleware/app_middleware.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/reducers/app_reducer.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/services/auth/firebase_auth_service.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:flireator/services/database/firestore_service.dart';
import 'package:flireator/services/http_service.dart';
import 'package:flireator/services/platform_service.dart';
import 'package:flireator/utils/redux/store_operation.dart';
import 'package:redux/redux.dart';

/// Services can be injected, or if missing are given default values
class ReduxBundle {
  static var _bucketName = 'gs://crowdleague-profile-pics';
  static var _extraMiddlewares = <Middleware>[];
  static var _storeOperations = <StoreOperation>[];
  static Settings? _firestoreSettings;

  static void setup(
      {String? bucketName,
      List<Middleware>? extraMiddlewares,
      List<StoreOperation>? storeOperations,
      Settings? firestoreSettings}) {
    _bucketName = bucketName ?? _bucketName;
    _extraMiddlewares = extraMiddlewares ?? _extraMiddlewares;
    _storeOperations = storeOperations ?? _storeOperations;
    _firestoreSettings = firestoreSettings;
  }

  /// Services
  final AuthService _authService;
  final DatabaseService _databaseService;
  final PlatformService _platformService;
  final HttpService _httpService;

  ReduxBundle(
      {List<Middleware>? extraMiddlewares,
      AuthService? authService,
      DatabaseService? databaseService,
      PlatformService? platformService,
      HttpService? httpService})
      : _authService = authService ?? FirebaseAuthService(),
        _databaseService = databaseService ?? FirestoreService(),
        _platformService = platformService ?? PlatformService(),
        _httpService = httpService ?? HttpService();

  Future<Store<AppState>> createStore() async {
    final _store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: [
        ...createAppMiddleware(
            authService: _authService,
            databaseService: _databaseService,
            platformService: _platformService,
            httpService: _httpService),
        ..._extraMiddlewares
      ],
    );

    // now that we have a store, run any store operations that were added
    for (final operation in _storeOperations) {
      await operation.runOn(_store);
    }

    // finally, if firestore settings were added, set the instance to use them
    if (_firestoreSettings != null) {
      FirebaseFirestore.instance.settings = _firestoreSettings!;
    }

    return _store;
  }
}
