import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/state_types.dart';

/// The [ThrowingErrorHandlers] class provides handlers that just throw again after
/// catching. We have this class for use during development where can be useful
/// to have the debugger break on errors rather than catch and handle them.
class ThrowingErrorHandlers<S extends AstroState> with ErrorHandlers<S> {
  @override
  S handleLandingError(
      {required Object thrown,
      required StackTrace trace,
      required LandingMission mission,
      required S state}) {
    throw thrown;
  }

  @override
  AstroState handleLaunchError(
      {required Object thrown,
      required StackTrace trace,
      required AwayMission mission,
      required S state}) {
    throw thrown;
  }
}
