import 'package:astro_core_interface/astro_core_interface.dart';

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
