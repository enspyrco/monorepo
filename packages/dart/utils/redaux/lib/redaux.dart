/// Support for doing something awesome.
///
/// More dartdocs go here.
library redaux;

import 'dart:async';

abstract class Action<S extends State> {
  const Action();
  Reducer<S>? get reducer;
  Middleware<S>? get middleware;
}

abstract class Middleware<S extends State> {
  void call(ReduxStore<S> store, Action<S> action);
}

abstract class Reducer<S extends State> {
  S call(S state, Action<S> action);
}

abstract class State {}

abstract class ReduxService {}

class ReduxStore<S extends State> {
  ReduxStore({
    required S state,
    StreamController<S>? streamController,
  })  : _state = state,
        _streamController = streamController ?? StreamController<S>();

  S _state;

  final StreamController<S> _streamController;

  /// Returns the current state tree of the application.
  /// It is equal to the last value returned by the store's reducer.
  S get state => _state;

  /// Dispatches a [Action]. This is the only way to trigger a state change.
  /// Arguments:
  /// - [action]: A plain object describing the change that makes sense for the
  ///   application.
  ///
  ///   Actions are the only way to get data into the store, so any data,
  ///   whether from the UI events, network callbacks, or other sources such as
  ///   WebSockets needs to eventually be dispatched as actions. Actions must
  ///   inherit from or implement [Action].
  ///
  /// See: https://redux.js.org/api/store#dispatchaction
  void dispatch(Action<S> action) {
    // let the middleware go free
    action.middleware?.call(this, action);

    // reduce if there is a reducer
    _state = action.reducer?.call(_state, action) ?? _state;

    // put an event in the stream with the new state
    _streamController.add(_state);
  }

  Stream<S> get stateChanges => _streamController.stream;
}
