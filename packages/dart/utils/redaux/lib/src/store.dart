import 'dart:async';

import 'package:redaux/redaux.dart';

/// [stateChangesController] should be broadcast type as UI components will
/// listen for a time at random intervals and only want the state changes while
/// they are listening.
///
/// Passing in [endWares] allows logic to run on every dispatched [Action], after
/// the action's reducer or middleware has been called. If the same result can
/// be achieved using just actions, without adding endware, the 1:1
/// relationship between Actions and Middleware/Reducers will probably make your
/// app easier to reason about.
class Store<S extends RootState> {
  Store({
    required S state,
    StreamController<S>? stateChangesController,
    List<Endware>? endWares,
  })  : _state = state,
        _endWares = endWares;
  S _state;

  final StreamController<S> _stateChangesController =
      StreamController<S>.broadcast();

  /// Any endWares are called on every dispatched action, see [Endware].
  final List<Endware>? _endWares;

  /// Returns the current state tree of the application.
  /// It is equal to the last value returned by the store's reducer.
  S get state => _state;

  /// Dispatching an [Action] is the only way to trigger a state change.
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
    print(action);

    // call reducer for sync actions
    if (action is SyncAction<S>) {
      _state = action.arrive(_state);

      // put an event in the stream with the new state
      _stateChangesController.add(_state);
    }

    // call middleware for async actions
    if (action is AsyncAction<S>) {
      tryLeaving(action);
    }

    _endWares?.forEach((fn) => fn.call(this, action));
  }

  /// This function wraps the `leave` calls in a try/catch and if the
  /// call throws, an [ErrorMessage] is added to the AppState.
  /// We do this in a separate async function so the `dispatch` function (that
  /// calls this async function) can stay sync so dispatching SyncActions
  /// (that change state) will be a sync call.
  void tryLeaving(AsyncAction<S> action) async {
    try {
      await action.leave(this);
    } catch (thrown, trace) {
      var newErrorMessages = [
        ErrorMessage(message: '$thrown', trace: '$trace'),
        ...state.errorMessages
      ];

      // TODO: can we avoid the need to cast here?
      _state = state.copyWith(errorMessages: newErrorMessages) as S;
    }
  }

  Stream<S> get stateChanges => _stateChangesController.stream;
}
