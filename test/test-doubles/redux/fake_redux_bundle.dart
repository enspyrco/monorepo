import 'dart:async';

import 'package:redux/src/store.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/utils/redux_bundle.dart';

/// The purpose of this class is to provide the [Store] that it is passed in as
/// a parameter, when [ReduxBundle.createStore()] is called by the [AppWidget].
/// The store could be a fake with the desired properties, or a real store with
/// fake services.
class FakeReduxBundle implements ReduxBundle {
  final Store<AppState> _store;

  FakeReduxBundle({required Store<AppState> store}) : _store = store;

  @override
  Future<Store<AppState>> createStore() => Future.value(_store);
}
