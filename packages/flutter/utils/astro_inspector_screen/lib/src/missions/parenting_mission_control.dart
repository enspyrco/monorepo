import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

import 'parented_missions.dart';

/// An [AwayMissionControl] object is created by [MissionControl] on each call
/// to [AwayMision.flightPlan] for the purpose of allowing land/launch calls
/// inside `flightPlan` to automatically set the parent.
///
/// The call to `launch` & `land` is just passed on to [MissionControl.launch] &
/// [MissionControl.land], while setting the `parent` member of the mission.
class ParentingMissionControl<S extends AstroState>
    implements MissionControl<S> {
  ParentingMissionControl(
      MissionControl<S> missionControl, AwayMission<S> currentMission)
      : _missionControl = missionControl,
        _currentMission = currentMission;
  final MissionControl<S> _missionControl;
  final AwayMission<S> _currentMission;

  @override
  void land(LandingMission<S> mission) =>
      _missionControl.land(ParentedLandingMission(mission, _currentMission));

  @override
  Future<void> launch(AwayMission<S> mission) =>
      _missionControl.launch(ParentedAwayMission(mission, _currentMission));

  @override
  Stream<S> get onStateChange => _missionControl.onStateChange;

  @override
  S get state => _missionControl.state;
}
