library astro_error_handling_interface;

import 'package:astro_state_interface/astro_state_interface.dart';

mixin BaseErrorHandlers<S extends AstroState> {
  AstroState handleLaunchError(
      {required Object thrown,
      required StackTrace trace,
      required dynamic mission,
      required S state});
  AstroState handleLandingError(
      {required Object thrown,
      required StackTrace trace,
      required dynamic mission,
      required S state});
}
