import 'package:json_types/json_types.dart';

import 'mission_control.dart';
import 'root_state.dart';

/// All missions must extend either [AwayMission] or [LandingMission], which
/// both inherit from [Mission].
abstract class Mission {
  AwayMission? parent;
  JsonMap toJson();
}

abstract class LandingMission<T extends RootState> extends Mission {
  T landingInstructions(T state);
}

abstract class AwayMission<T extends RootState> extends Mission {
  Future<void> flightPlan(AwayMissionControl<T> missionControl);
}
