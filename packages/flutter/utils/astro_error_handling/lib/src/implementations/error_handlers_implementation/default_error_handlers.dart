import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/state_types.dart';

/// TODO: We need a type for [state] that has [copyWith(reports: ...]
/// and as [extends AstroState]
///
class DefaultErrorHandlers<S extends AstroState> implements ErrorHandlers<S> {
  @override
  void handleLandingError({
    required Object thrown,
    required StackTrace trace,
    required ErrorReportSettings reportSettings,
    required LandingMission mission,
    required MissionControl missionControl,
  }) {
    missionControl.land(CreateErrorReport<S>(thrown, trace,
        settings: reportSettings, details: {'While landing': '$mission'}));
  }

  @override
  void handleLaunchError({
    required Object thrown,
    required StackTrace trace,
    required ErrorReportSettings reportSettings,
    required AwayMission mission,
    required MissionControl missionControl,
  }) {
    missionControl.land(CreateErrorReport<S>(thrown, trace,
        settings: reportSettings, details: {'While launching': '$mission'}));
  }
}
