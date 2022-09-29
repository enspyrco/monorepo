import 'package:astro/core/mission.dart';

import 'example_app_state.dart';
import 'example_exception.dart';

class ExampleLandingMission extends LandingMission<ExampleAppState> {
  @override
  ExampleAppState landingInstructions(ExampleAppState state) {
    throw ExampleException();
  }

  @override
  toJson() => {};
}
