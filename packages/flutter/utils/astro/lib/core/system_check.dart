import 'mission.dart';
import 'mission_control.dart';
import 'root_state.dart';

/// [SystemCheck]s in astro are are called for every [Mission] - before
/// [AwayMission.flightPlan] is called and after [LandingMission.landingInstructions]
/// is called.
///
/// An [AwayMission] involves calling an async function ([AwayMission.flightPlan]),
/// and we don’t know when that function will return, but we want to be able to
/// do things when we first start the mission, so we run the [SystemCheck] first
/// in [MissionControl.launch].
///
/// On the other hand, we always want to know what the new state is *after* a
/// [LandingMission.landingInstructions] has run so we run the [SystemCheck]
/// last in [MissionControl.land].
///
/// When multiple system checks are added to [MissionControl], they are called
/// in the order they were added to the [MissionControl.systemChecks] list.
abstract class SystemCheck<S extends RootState> {
  const SystemCheck();
  void call(MissionControl<S> missionControl, Mission mission);
}
