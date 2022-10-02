import 'dart:async';

import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_error_handling_interface/astro_error_handling_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';

import '../astro.dart';

/// Pass in [systemChecks] to run logic on every [Mission], before
/// [AwayMission.flightPlan] is called and after
/// [LandingMission.landingInstructions] is called.
///
/// Make sure [onStateChangeController] is broadcast type as UI components will
/// listen for a time at random intervals and only want the state changes while
/// they are listening.
class DefaultMissionControl<T extends AstroState> implements MissionControl<T> {
  DefaultMissionControl({
    required T state,
    ErrorHandlers<T>? errorHandlers,
    StreamController<T>? onStateChangeController,
    List<SystemCheck>? systemChecks,
  })  : _state = state,
        _errorHandlers = errorHandlers ?? DefaultErrorHandlers<T>(),
        _systemChecks = systemChecks;
  T _state;
  final ErrorHandlers _errorHandlers;

  final StreamController<T> _onStateChangeController =
      StreamController<T>.broadcast();

  /// [SystemCheck]s are called on every mission, before [AwayMission.flightPlan]
  /// is called and after [LandingMission.landingInstructions] is called.
  final List<SystemCheck>? _systemChecks;

  /// Returns the current state tree of the application.
  @override
  T get state => _state;

  /// Landing a [LandingMission] is the only way to upate the state held in
  /// MissionControl, so any data, whether from UI events, network callbacks, or other
  /// sources such as WebSockets needs to eventually be landed (ie. call land on
  /// [LandingMission] that described the desired state change).
  @override
  void land(LandingMission<T> mission) {
    print('land: $mission');

    try {
      _state = mission.landingInstructions(_state);
    } catch (thrown, trace) {
      print('landing error: $thrown');

      _state = _errorHandlers.handleLandingError(
          thrown: thrown, trace: trace, mission: mission, state: _state) as T;
    }

    // emit the new state for any listeners (eg. StateStreamBuilder widgets)
    _onStateChangeController.add(_state);

    _systemChecks?.forEach((fn) => fn.call(this, mission));
  }

  /// Creation or retrieval of data that is asynchronous must be performed via
  /// an [AwayMission]. If the desired end result is changing the app state,
  /// the [AwayMission] should land a [LandingMission] when it is complete.
  @override
  Future<void> launch(AwayMission<T> mission) async {
    print('launch: $mission');

    _systemChecks?.forEach((fn) => fn.call(this, mission));

    try {
      await mission.flightPlan(DefaultAwayMissionControl(this, mission));
    } catch (thrown, trace) {
      print('launch error: $thrown');

      _state = _errorHandlers.handleLaunchError(
          thrown: thrown, trace: trace, mission: mission, state: _state) as T;

      // emit the new state for any listeners (eg. StateStreamBuilder widgets)
      _onStateChangeController.add(_state);
    }
  }

  @override
  Stream<T> get onStateChange => _onStateChangeController.stream;
}

/// An [AwayMissionControl] object is created by [MissionControl] on each call
/// to [AwayMision.flightPlan] for the purpose of allowing land/launch calls
/// inside `flightPlan` to automatically set the parent.
///
/// The call to `launch` & `land` is just passed on to [MissionControl.launch] &
/// [MissionControl.land], while setting the `parent` member of the mission.
class DefaultAwayMissionControl<T extends AstroState>
    implements AwayMissionControl<T> {
  DefaultAwayMissionControl(
      MissionControl<T> missionControl, AwayMission<T> currentMission)
      : _missionControl = missionControl,
        _currentMission = currentMission;
  final MissionControl<T> _missionControl;
  final AwayMission<T> _currentMission;

  @override
  void land(LandingMission<T> mission) =>
      _missionControl.land(mission..parent = _currentMission);

  @override
  Future<void> launch(AwayMission<T> mission) =>
      _missionControl.launch(mission..parent = _currentMission);
}
