import 'dart:async';

import 'package:astro/astro.dart';

/// Pass in [systemChecks] to run logic on every [Mission], before
/// [AwayMission.flightPlan] is called and after
/// [DockingMission.dockingInstructions] is called.
///
/// Make sure [onStateChangeController] is broadcast type as UI components will
/// listen for a time at random intervals and only want the state changes while
/// they are listening.
class MissionControl<S extends RootState> {
  MissionControl({
    required S state,
    StreamController<S>? onStateChangeController,
    List<SystemCheck>? systemChecks,
  })  : _state = state,
        _systemChecks = systemChecks;
  S _state;

  final StreamController<S> _onStateChangeController =
      StreamController<S>.broadcast();

  /// [SystemCheck]s are called on every mission, before [AwayMission.flightPlan]
  /// is called and after [DockingMission.dockingInstructions] is called.
  final List<SystemCheck>? _systemChecks;

  /// Returns the current state tree of the application.
  S get state => _state;

  /// Landing a [DockingMission] is the only way to upate the state held in the
  /// store, so any data, whether from UI events, network callbacks, or other
  /// sources such as WebSockets needs to eventually be landed (ie. call land on
  /// [DockingMission] that described the desired state change).
  void land(DockingMission<S> mission) {
    print('land: $mission');

    _state = mission.dockingInstructions(_state);

    // emit the new state for any listeners (eg. StateStreamBuilder widgets)
    _onStateChangeController.add(_state);

    _systemChecks?.forEach((fn) => fn.call(this, mission));
  }

  /// Creation or retrieval of data that is asynchronous must be performed via
  /// an [AwayMission]. If the desired end result is changing the app state,
  /// the [AwayMission] should land a [DockingMission] when it is complete.
  void launch(AwayMission<S> mission) async {
    print('launch: $mission');

    _systemChecks?.forEach((fn) => fn.call(this, mission));

    /// We wrap the `launch` calls in a try/catch and if the
    /// call throws, an [ErrorMessage] is added to the AppState.
    try {
      await mission.flightPlan(this);
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
