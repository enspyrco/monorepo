/// Support for doing something awesome.
///
/// More dartdocs go here.
library enspyr_redux;

import 'dart:async';

abstract class ReduxAction<S extends ReduxState> {
  const ReduxAction();
  ReduxReducer<S>? get reducer;
  ReduxMiddleware<S>? get middleware;
}

abstract class ReduxMiddleware<S extends ReduxState> {
  void call(ReduxStore<S> store, ReduxAction<S> action);
}

abstract class ReduxReducer<S extends ReduxState> {
  S call(S state, ReduxAction<S> action);
}

abstract class ReduxState {}

abstract class ReduxService {}

class ReduxStore<S extends ReduxState> {
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

  /// Dispatches a [ReduxAction]. This is the only way to trigger a state change.
  /// Arguments:
  /// - [action]: A plain object describing the change that makes sense for the
  ///   application.
  ///
  ///   Actions are the only way to get data into the store, so any data,
  ///   whether from the UI events, network callbacks, or other sources such as
  ///   WebSockets needs to eventually be dispatched as actions. Actions must
  ///   inherit from or implement [ReduxAction].
  ///
  /// See: https://redux.js.org/api/store#dispatchaction
  void dispatch(ReduxAction<S> action) {
    // let the middleware go free
    action.middleware?.call(this, action);

    // reduce if there is a reducer
    _state = action.reducer?.call(_state, action) ?? _state;

    // put an event in the stream with the new state
    _streamController.add(_state);
  }

  Stream<S> get stateChanges => _streamController.stream;
}
