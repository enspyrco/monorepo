import 'dart:async';

import 'package:json_types/json_types.dart';
import 'package:redaux/redaux.dart';

class Store<S extends RootState> {
  Store({
    required S state,
    StreamController<S>? stateChangesController,
  })  : _state = state,
        _stateChangesController =
            stateChangesController ?? StreamController<S>();

  S _state;

  final StreamController<S> _stateChangesController;
  final StreamController<JsonMap> _dispatchEventsController =
      StreamController<JsonMap>.broadcast();

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
  void dispatch(Action action, {AsyncAction<S>? parent}) {
    print(action);

    // call middleware for async actions
    if (action is AsyncAction<S>) {
      safeAsyncCall(action);
    }

    // call reducer for sync actions
    if (action is SyncAction<S>) {
      _state = action.reducer.call(_state, action);
    }

    if (const bool.fromEnvironment('REDAUX_DEVTOOLS')) {
      // Emit json describing the action and (potential) state change on
      // each action dispatch.
      _dispatchEventsController.add({
        'data': {
          'state': _state.toJson(),
          'action': action.toJson(parentId: parent?.hashCode)
        },
        'type': 'redfire:action_dispatched'
      });
    }

    // put an event in the stream with the new state
    _stateChangesController.add(_state);
  }

  /// This function wraps the middleware calls in a try/catch and if the
  /// middleware call throws, an [ErrorMessage] is added to the AppState.
  /// We do this in a separate async function so the `dispatch` function (that
  /// calls this async function) can stay sync so dispatching SyncActions
  /// (that change state) will be a sync call.
  void safeAsyncCall(AsyncAction<S> action) async {
    try {
      action.middleware.call(this, action);
    } catch (thrown, trace) {
      var newErrorMessages = [
        ErrorMessage(message: '$thrown', trace: '$trace'),
        ...state.errorMessages
      ];

      // TODO: avoid the need to cast here
      _state = state.copyWith(errorMessages: newErrorMessages) as S;
    }
  }

  Stream<S> get stateChanges => _stateChangesController.stream;
  Stream<JsonMap> get dispatchEvents => _dispatchEventsController.stream;
}
