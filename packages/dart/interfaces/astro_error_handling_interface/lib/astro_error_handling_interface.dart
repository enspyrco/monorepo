library astro_error_handling_interface;

import 'package:astro_state_interface/astro_state_interface.dart';

mixin BaseErrorHandlers {
  AstroState handleLaunchError(AstroState state);
  AstroState handleLandingError(AstroState state);
}
