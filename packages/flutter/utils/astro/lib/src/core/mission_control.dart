import 'dart:async';

import 'package:astro/src/core/system_checks.dart';
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
///
/// The [errorHandlers] parameter takes an object of type [ErrorHandlers] which
/// will be act on anything that gets thrown while executing
/// [LandingMission.landingInstructions] or [AwayMission.flightPlan]. If no
/// object is passed, the Throwable is just rethrown, keeping the same stack
/// trace which is very useful in debugging.
class DefaultMissionControl<S extends AstroState> implements MissionControl<S> {
  DefaultMissionControl({
    required S state,
    ErrorHandlers<S>? errorHandlers,
    StreamController<S>? onStateChangeController,
    SystemChecks? systemChecks,
    WrappedMissionControlCtr? missionControlCtr,
  })  : _state = state,
        _errorHandlers = errorHandlers,
        _systemChecks = systemChecks ?? DefaultSystemChecks(),
        _missionControlCtr = missionControlCtr;
  S _state;
  final ErrorHandlers? _errorHandlers;

  /// This member is a constructor for creating special MissionControl objects,
  /// allowing for different behaviour under different circumstances - eg.
  /// when the Inspector is being used, extra information (such as the parent
  /// mission) can be added by the special MissionControl
  final WrappedMissionControlCtr? _missionControlCtr;

  final StreamController<S> _onStateChangeController =
      StreamController<S>.broadcast();

  /// [SystemCheck]s are called on every mission, before [AwayMission.flightPlan]
  /// is called and after [LandingMission.landingInstructions] is called.
  final SystemChecks _systemChecks;

  /// Returns the current state tree of the application.
  @override
  S get state => _state;

  /// A stream of the app state changes - the design of astro intends that your
  /// app would not need to use this stream directly but we expose it for edge
  /// cases.
  Stream<S> get stateChanges => _onStateChangeController.stream;

  /// Landing a [LandingMission] is the only way to upate the state held in
  /// MissionControl, so any data, whether from UI events, network callbacks, or other
  /// sources such as WebSockets needs to eventually be landed (ie. call land on
  /// [LandingMission] that described the desired state change).
  @override
  void land(LandingMission<S> mission) {
    for (final systemCheck in _systemChecks.preLand) {
      systemCheck(this, mission);
    }

    try {
      _state = mission.landingInstructions(_state);
    } catch (thrown, trace) {
      if (_errorHandlers == null) rethrow;
      _state = _errorHandlers!.handleLandingError(
          thrown: thrown, trace: trace, mission: mission, state: _state) as S;
    }

    // emit the new state for any listeners (eg. StateStreamBuilder widgets)
    _onStateChangeController.add(_state);

    for (final systemCheck in _systemChecks.postLand) {
      systemCheck(this, mission);
    }
  }

  /// Creation or retrieval of data that is asynchronous must be performed via
  /// an [AwayMission]. If the desired end result is changing the app state,
  /// the [AwayMission] should land a [LandingMission] when it is complete.
  @override
  Future<void> launch(AwayMission<S> mission) async {
    for (final systemCheck in _systemChecks.preLaunch) {
      systemCheck(this, mission);
    }

    try {
      if (_missionControlCtr != null) {
        await mission.flightPlan(_missionControlCtr!(this, mission));
      } else {
        await mission.flightPlan(this);
      }
      for (final systemCheck in _systemChecks.postLaunch) {
        systemCheck(this, mission);
      }
    } catch (thrown, trace) {
      if (_errorHandlers == null) rethrow;
      _state = _errorHandlers!.handleLaunchError(
          thrown: thrown, trace: trace, mission: mission, state: _state) as S;

      // emit the new state for any listeners (eg. StateStreamBuilder widgets)
      _onStateChangeController.add(_state);
    }
  }

  @override
  Stream<S> get onStateChange => _onStateChangeController.stream;
}
