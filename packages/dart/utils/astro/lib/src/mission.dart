import 'package:json_types/json_types.dart';

import '../astro.dart';

/// All missions must extend either [AwayMission] or [DockingMission], which
/// both inherit from [Mission].
abstract class Mission {
  AwayMission? parent;
  JsonMap toJson({int? parentId});
}

abstract class DockingMission<S extends RootState> extends Mission {
  S dockingInstructions(S state);
}

abstract class AwayMission<S extends RootState> extends Mission {
  Future<void> flightPlan(MissionControl<S> store);
}
