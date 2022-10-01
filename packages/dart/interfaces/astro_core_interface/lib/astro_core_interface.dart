library astro_core_interface;

import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:json_types/json_types.dart';

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
  Future<void> flightPlan(AwayMissionControl<T> missionControl);
}

///
abstract class MissionControl<T extends AstroState> {
  T get state;
  void land(LandingMission<T> mission);
  Future<void> launch(AwayMission<T> mission);
  Stream<T> get onStateChange;
}

abstract class AwayMissionControl<T extends AstroState> {
  void land(LandingMission<T> mission);
  Future<void> launch(AwayMission<T> mission);
}
