import 'dart:async';

import 'package:redaux/redaux.dart';

/// [stateChangesController] should be broadcast type as UI components will
/// listen for a time at random intervals and only want the state changes while
/// they are listening.
///
/// Passing in [systemChecks] allows logic to run on every dispatched [Action], after
/// the action's [launch] or [land] has been called. If the same result can
/// be achieved using just actions, without adding system checks, the 1:1
/// relationship between an Action a launch/land function will probably make your
/// app easier to reason about.
///
/// Actions must extend or implement either [AsyncAction] or [SyncAction],
/// each of which inherit from [Action].
class Store<S extends RootState> {
  Store({
    required S state,
    StreamController<S>? onStateChangeController,
    List<SystemCheck>? systemChecks,
  })  : _state = state,
        _systemChecks = systemChecks;
  S _state;

  final StreamController<S> _onStateChangeController =
      StreamController<S>.broadcast();

  /// [SystemCheck]s are called on every dispatched action, before [launch] is
  /// called or after [land] is called.
  final List<SystemCheck>? _systemChecks;

  /// Returns the current state tree of the application.
  S get state => _state;

  /// Landing a [SyncAction] is the only way to upate the state held in the
  /// store, so any data, whether from UI events, network callbacks, or other
  /// sources such as WebSockets needs to eventually be landed (ie. call land on
  /// the store with a SyncAction that described the desired state change).
  void land(SyncAction<S> action) {
    print('land: $action');

    _state = action.land(_state);

    // emit the new state for any listeners (eg. StateStreamBuilder widgets)
    _onStateChangeController.add(_state);

    _systemChecks?.forEach((fn) => fn.call(this, action));
  }

  /// Creation or retrieval of data that is asynchronous must be performed via
  /// an [AsyncAction]. If the desired end result is changing the app state,
  /// the [AsyncAction] should land a [SyncAction] when it is complete.
  void launch(AsyncAction<S> action) async {
    print('launch: $action');

    _systemChecks?.forEach((fn) => fn.call(this, action));

    /// We wrap the `launch` calls in a try/catch and if the
    /// call throws, an [ErrorMessage] is added to the AppState.
    try {
      await action.launch(this);
    } catch (thrown, trace) {
      print(thrown);
      var newErrorMessages = [
        ErrorMessage(message: '$thrown', trace: '$trace'),
        ...state.errorMessages
      ];

      // TODO: can we avoid the need to cast here?
      _state = state.copyWith(errorMessages: newErrorMessages) as S;
    }
  }

  Stream<S> get onStateChange => _onStateChangeController.stream;
}
