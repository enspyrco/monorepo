import 'package:astro_types/state_types.dart';

import 'core_types.dart';

abstract class AppStateErrorHandling {
  abstract final ErrorHandlingState error;
}

abstract class ErrorHandlingState {
  abstract final List<ErrorReport> reports;
}

enum ErrorReportSettings {
  fullReport('Please remain calm but...', true, true),
  infoMessage('Just letting you know...', false, false);

  final String reportTitle;
  final bool showStackTrace;
  final bool showDetails;

  const ErrorReportSettings(
      this.reportTitle, this.showStackTrace, this.showDetails);
}

abstract class ErrorReport {
  abstract final String message;
  abstract final String? trace;
  abstract final ErrorReportSettings settings;
  abstract final Map<String, String>? details;
}

abstract class ErrorHandlers<S extends AstroState> {
  void handleLaunchError({
    required Object thrown,
    required StackTrace trace,
    required ErrorReportSettings reportSettings,
    required AwayMission mission,
    required MissionControl missionControl,
  });
  void handleLandingError({
    required Object thrown,
    required StackTrace trace,
    required ErrorReportSettings reportSettings,
    required LandingMission mission,
    required MissionControl missionControl,
  });
}
