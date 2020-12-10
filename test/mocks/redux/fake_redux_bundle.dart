import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:redux/src/store.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/platform_service.dart';
import 'package:the_process/utils/redux_bundle.dart';

/// The purpose of this class is to provide the [Store] that it is passed in as
/// a parameter, when createStore() is called.  The store will be a fake with
/// the desired properties.
class FakeReduxBundle implements ReduxBundle {
  final Store<AppState> _store;

  FakeReduxBundle({@required Store<AppState> store}) : _store = store;

  @override
  Future<Store<AppState>> createStore() => Future.value(_store);

  @override
  AuthService get auth => throw UnimplementedError();

  @override
  DatabaseService get database => throw UnimplementedError();

  @override
  PlatformService get platformService => throw UnimplementedError();
}
