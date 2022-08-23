import 'dart:async';

import 'action.dart';
import 'state.dart';

class Store<S extends State> {
  Store({
    required S state,
    StreamController<S>? streamController,
  })  : _state = state,
        _streamController = streamController ?? StreamController<S>();

  S _state;

  final StreamController<S> _streamController;

  /// Returns the current state tree of the application.
  /// It is equal to the last value returned by the store's reducer.
  S get state => _state;

  /// Dispatches an [Action]. This is the only way to trigger a state change.
  /// Arguments:
  /// - [action]: A plain object describing the action the store should take,
  ///             either call a middleware for async or reducer for sync actions
  ///
  ///   Actions are the only way to upate the app state held in the store, so
  ///   any data, whether from UI events, network callbacks, or other sources
  ///   such as WebSockets needs to eventually be dispatched as sync actions to
  ///   update the app state.
  ///
  ///   Actions must extend or implement either [AsyncAction] or [SyncAction],
  ///   each of which inherit from [Action].
  ///
  /// See: https://redux.js.org/api/store#dispatchaction
  void dispatch(Action action) {
    // call middleware for async actions
    if (action is AsyncAction<S>) {
      action.middleware?.call(this, action);
    }

    // call reducer for sync actions
    if (action is SyncAction<S>) {
      _state = action.reducer?.call(_state, action) ?? _state;
    }

    // put an event in the stream with the new state
    _streamController.add(_state);
  }

  Stream<S> get stateChanges => _streamController.stream;
}
