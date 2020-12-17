import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:redux/src/store.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/utils/redux_bundle.dart';

/// The purpose of this class is to take a [Completer] that completes with
/// a fake [Store] with the desired properties.
class CompletableFakeReduxBundle implements ReduxBundle {
  final Completer<Store<AppState>> _reduxCompleter;

  CompletableFakeReduxBundle({@required Completer<Store<AppState>> completer})
      : _reduxCompleter = completer {
    ;
  }

  @override
  Future<Store<AppState>> createStore() => _reduxCompleter.future;
}
