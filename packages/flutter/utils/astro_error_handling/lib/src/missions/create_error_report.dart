import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../astro_error_handling.dart';

class CreateErrorReport<S extends AstroState> extends LandingMission<S> {
  const CreateErrorReport(this.error, this.trace,
      {this.settings = ErrorReportSettings.fullReport, this.details});

  final Object error;
  final StackTrace trace;
  final ErrorReportSettings settings;
  final Map<String, String>? details;

  @override
  S landingInstructions(S state) {
    String message =
        (error is AstroException && settings == ErrorReportSettings.infoMessage)
            ? (error as AstroException).message
            : '{$error}';
    if (details != null && settings != ErrorReportSettings.infoMessage) {
      message += [
        for (var entry in details!.entries) '${entry.key}: ${entry.value}'
      ].join('\n');
    }
    var report = DefaultErrorReport(
      message: message,
      trace: '$trace',
      settings: settings,
    );
    // we don't have the AppState type here so we cast to dynamic & use dynamic invocation
    final dynamicState = state as dynamic;
    List<DefaultErrorReport> newReports = [
      report,
      ...dynamicState.error.reports
    ];
    List<PageState> newStack = [
      ErrorReportPageState(report),
      ...dynamicState.navigation.stack
    ];

    /// Sections
    ErrorHandlingState newError =
        dynamicState.error.copyWith(reports: newReports);
    NavigationState newNavigation =
        dynamicState.navigation.copyWith(stack: newStack);

    return dynamicState.copyWith(error: newError, navigation: newNavigation)
        as S;
  }

  @override
  toJson() => {
        'name_': 'CreateErrorReport',
        'state_': {'error': '$error', 'trace': '$trace', 'details': details}
      };
}
