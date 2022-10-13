library astro_types;

import 'json_types.dart';
import 'state_types.dart';

/// All missions must extend either [AwayMission] or [LandingMission], which
/// both inherit from [Mission].
abstract class Mission {
  AwayMission? parent;
  JsonMap toJson();
}

abstract class LandingMission<T extends AstroState> extends Mission {
  T landingInstructions(T state);
}

abstract class AwayMission<T extends AstroState> extends Mission {
  Future<void> flightPlan(MissionControl<T> missionControl);
}

///
abstract class MissionControl<T extends AstroState> {
  T get state;
  void land(LandingMission<T> mission);
  Future<void> launch(AwayMission<T> mission);
  Stream<T> get onStateChange;
}

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
abstract class SystemCheck<S extends AstroState> {
  const SystemCheck();
  void call(MissionControl<S> missionControl, Mission mission);
}

abstract class AstroProvider<S extends AstroState> {}
