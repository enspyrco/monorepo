import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

import '../example_exception.dart';

class ExampleAwayMission<S extends AstroState> extends AwayMission<S> {
  @override
  Future<void> flightPlan(MissionControl<S> missionControl) async {
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
