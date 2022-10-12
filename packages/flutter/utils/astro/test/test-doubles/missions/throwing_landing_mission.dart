import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

import '../example_exception.dart';

class ThrowingLandingMission<S extends AstroState> extends LandingMission<S> {
  @override
  S landingInstructions(S state) {
    throw ExampleException();
  }

  @override
  toJson() => {};
}
