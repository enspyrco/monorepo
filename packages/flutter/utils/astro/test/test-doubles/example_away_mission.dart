import 'package:astro_core_interface/astro_core_interface.dart';

import 'example_app_state.dart';
import 'example_exception.dart';

class ExampleAwayMission extends AwayMission<ExampleAppState> {
  @override
  Future<void> flightPlan(
      AwayMissionControl<ExampleAppState> missionControl) async {
    throw ExampleException();
  }

  @override
  toJson() => {
        'name_': 'ExampleAwayMission',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parent?.hashCode
      };
}
