import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:json_types/json_types.dart';

import 'mission_control.dart';

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
