import 'dart:async';

import 'package:astro_error_handling/astro_error_handling.dart';

import '../astro.dart';

/// Pass in [systemChecks] to run logic on every [Mission], before
/// [AwayMission.flightPlan] is called and after
/// [LandingMission.landingInstructions] is called.
///
/// Make sure [onStateChangeController] is broadcast type as UI components will
/// listen for a time at random intervals and only want the state changes while
/// they are listening.
class MissionControl<T extends RootState> {
  MissionControl({
    required T state,
    StreamController<T>? onStateChangeController,
    List<SystemCheck>? systemChecks,
  })  : _state = state,
        _systemChecks = systemChecks;
  T _state;

  final StreamController<T> _onStateChangeController =
      StreamController<T>.broadcast();

  /// [SystemCheck]s are called on every mission, before [AwayMission.flightPlan]
  /// is called and after [LandingMission.landingInstructions] is called.
  final List<SystemCheck>? _systemChecks;

  /// Returns the current state tree of the application.
  T get state => _state;

  /// Landing a [LandingMission] is the only way to upate the state held in
  /// MissionControl, so any data, whether from UI events, network callbacks, or other
  /// sources such as WebSockets needs to eventually be landed (ie. call land on
  /// [LandingMission] that described the desired state change).
  void land(LandingMission<T> mission) {
    print('land: $mission');

    _state = mission.landingInstructions(_state);

    // emit the new state for any listeners (eg. StateStreamBuilder widgets)
    _onStateChangeController.add(_state);

    _systemChecks?.forEach((fn) => fn.call(this, mission));
  }

  /// Creation or retrieval of data that is asynchronous must be performed via
  /// an [AwayMission]. If the desired end result is changing the app state,
  /// the [AwayMission] should land a [LandingMission] when it is complete.
  Future<void> launch(AwayMission<T> mission) async {
    print('launch: $mission');

    _systemChecks?.forEach((fn) => fn.call(this, mission));

    /// We wrap the `launch` calls in a try/catch and if the
    /// call throws, an [ErrorMessage] is added to the AppState.
    try {
      await mission.flightPlan(AwayMissionControl(this, mission));
    } catch (thrown, trace) {
      print(thrown);

      // TODO: avoid dynamic dispatch
      _state = (state as dynamic).copyWith(errorMessages: [
        ErrorMessage(message: '$thrown', trace: '$trace'),
        ...state.errorMessages
      ]) as T;
    }
  }

  Stream<T> get onStateChange => _onStateChangeController.stream;
}

/// An [AwayMissionControl] object is created by [MissionControl] on each call
/// to [AwayMision.flightPlan] for the purpose of allowing land/launch calls
/// inside `flightPlan` to automatically set the parent.
///
/// The call to `launch` & `land` is just passed on to [MissionControl.launch] &
/// [MissionControl.land], while setting the `parent` member of the mission.
class AwayMissionControl<T extends RootState> {
  AwayMissionControl(
      MissionControl<T> missionControl, AwayMission<T> currentMission)
      : _missionControl = missionControl,
        _currentMission = currentMission;
  final MissionControl<T> _missionControl;
  final AwayMission<T> _currentMission;

  void land(LandingMission<T> mission) =>
      _missionControl.land(mission..parent = _currentMission);

  Future<void> launch(AwayMission<T> mission) =>
      _missionControl.launch(mission..parent = _currentMission);
}
