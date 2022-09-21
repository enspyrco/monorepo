import 'package:astro/astro.dart';
import 'package:astro_dev_tools_screen/astro_dev_tools_screen.dart';

class TestAwayMission extends AwayMission<DevToolsState> {
  @override
  Future<void> flightPlan(MissionControl<DevToolsState> store) async {}

  @override
  toJson({int? parentId}) => {
        'name_': 'TestAwayMission',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId
      };
}
