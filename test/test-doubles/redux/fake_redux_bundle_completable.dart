import 'dart:async';

import 'package:redux/src/store.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/utils/redux_bundle.dart';

/// The purpose of this class is to take a [Completer] that completes with
/// a fake [Store] with the desired properties.
class FakeReduxBundleCompletable implements ReduxBundle {
  final Completer<Store<AppState>> _reduxCompleter;

  FakeReduxBundleCompletable({required Completer<Store<AppState>> completer})
      : _reduxCompleter = completer;

  @override
  Future<Store<AppState>> createStore() => _reduxCompleter.future;
}
