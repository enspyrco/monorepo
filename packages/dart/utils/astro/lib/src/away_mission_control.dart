import '../astro.dart';

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
