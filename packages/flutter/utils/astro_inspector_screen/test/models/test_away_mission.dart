import 'package:astro/astro.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';

class TestAwayMission extends AwayMission<InspectorState> {
  @override
  Future<void> flightPlan(
      MissionControl<InspectorState> missionControl) async {}

  @override
  toJson({int? parentId}) => {
        'name_': 'TestAwayMission',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId
      };
}
