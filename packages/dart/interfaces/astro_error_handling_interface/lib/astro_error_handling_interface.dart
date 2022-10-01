library astro_error_handling_interface;

import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';

mixin ErrorHandlers<S extends AstroState> {
  AstroState handleLaunchError(
      {required Object thrown,
      required StackTrace trace,
      required AwayMission mission,
      required S state});
  AstroState handleLandingError(
      {required Object thrown,
      required StackTrace trace,
      required LandingMission mission,
      required S state});
}
