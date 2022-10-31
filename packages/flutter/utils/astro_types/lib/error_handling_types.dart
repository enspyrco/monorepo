import 'package:astro_types/state_types.dart';

import 'core_types.dart';

abstract class ErrorHandlers<S extends AstroState> {
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
