import 'dart:async';

import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/state_types.dart';

typedef WrappedMissionControlCtr = MissionControl<S>
    Function<S extends AstroState>(MissionControl<S>, AwayMission<S>);

/// Pass in [systemChecks] to run logic on every [Mission], before
/// [AwayMission.flightPlan] is called and after
/// [LandingMission.landingInstructions] is called.
///
/// Make sure [onStateChangeController] is broadcast type as UI components will
/// listen for a time at random intervals and only want the state changes while
/// they are listening.
class DefaultMissionControl<S extends AstroState> implements MissionControl<S> {
  DefaultMissionControl({
    required S state,
    ErrorHandlers<S>? errorHandlers,
    StreamController<S>? onStateChangeController,
    List<SystemCheck>? systemChecks,
    WrappedMissionControlCtr? missionControlCtr,
  })  : _state = state,
        _errorHandlers = errorHandlers ?? DefaultErrorHandlers<S>(),
        _systemChecks = systemChecks,
        _missionControlCtr = missionControlCtr;
  S _state;
  final ErrorHandlers _errorHandlers;

  /// This member is a constructor for creating special MissionControl objects,
  /// allowing for different behaviour under different circumstances - eg.
  /// when the Inspector is being used, extra information (such as the parent
  /// mission) can be added by the special MissionControl
  final WrappedMissionControlCtr? _missionControlCtr;

  final StreamController<S> _onStateChangeController =
      StreamController<S>.broadcast();

  /// [SystemCheck]s are called on every mission, before [AwayMission.flightPlan]
  /// is called and after [LandingMission.landingInstructions] is called.
  final List<SystemCheck>? _systemChecks;

  /// Returns the current state tree of the application.
  @override
  S get state => _state;

  /// Landing a [LandingMission] is the only way to upate the state held in
  /// MissionControl, so any data, whether from UI events, network callbacks, or other
  /// sources such as WebSockets needs to eventually be landed (ie. call land on
  /// [LandingMission] that described the desired state change).
  @override
  void land(LandingMission<S> mission) {
    try {
      _state = mission.landingInstructions(_state);
    } catch (thrown, trace) {
      _state = _errorHandlers.handleLandingError(
          thrown: thrown, trace: trace, mission: mission, state: _state) as S;
    }

    // emit the new state for any listeners (eg. StateStreamBuilder widgets)
    _onStateChangeController.add(_state);

    _systemChecks?.forEach((fn) => fn.call(this, mission));
  }

  /// Creation or retrieval of data that is asynchronous must be performed via
  /// an [AwayMission]. If the desired end result is changing the app state,
  /// the [AwayMission] should land a [LandingMission] when it is complete.
  @override
  Future<void> launch(AwayMission<S> mission) async {
    _systemChecks?.forEach((fn) => fn.call(this, mission));

    try {
      if (_missionControlCtr != null) {
        await mission.flightPlan(_missionControlCtr!(this, mission));
      } else {
        await mission.flightPlan(this);
      }
    } catch (thrown, trace) {
      _state = _errorHandlers.handleLaunchError(
          thrown: thrown, trace: trace, mission: mission, state: _state) as S;

      // emit the new state for any listeners (eg. StateStreamBuilder widgets)
      _onStateChangeController.add(_state);
    }
  }

  @override
  Stream<S> get onStateChange => _onStateChangeController.stream;
}
