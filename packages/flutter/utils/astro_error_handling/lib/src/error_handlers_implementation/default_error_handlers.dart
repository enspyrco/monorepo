import 'package:astro_error_handling/src/navigation/routes/error_report/error_report_page_state.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../state/interfaces/default_error_handling_state.dart';
import '../state/models/error_report.dart';

/// TODO: We need a type for [state] that has [copyWith(reports: ...]
/// and as [extends AstroState]
///
class DefaultErrorHandlers<S extends AstroState> with ErrorHandlers<S> {
  @override
  S handleLandingError(
      {required Object thrown,
      required StackTrace trace,
      required LandingMission mission,
      required S state}) {
    var report = ErrorReport(
        message: 'Landing $mission, resulted in $thrown', trace: '$trace');
    // we don't have the app state type here so cast to dynamic to acess
    // the error member then cast to the known type
    var reports = (state as DefaultErrorHandlingState).error.reports;
    var newReports = [report, ...reports];
    var stack = (state as dynamic).navigation.stack as List<PageState>;
    var newStack = [ErrorReportPageState(report), ...stack];

    /// Sections
    var newError = (state as DefaultErrorHandlingState)
        .error
        .copyWith(reports: newReports);
    var newNavigation = (state as dynamic).navigation.copyWith(stack: newStack);

    return (state as dynamic)
        .copyWith(error: newError, navigation: newNavigation) as S;
  }

  @override
  AstroState handleLaunchError(
      {required Object thrown,
      required StackTrace trace,
      required AwayMission mission,
      required S state}) {
    var report = ErrorReport(
        message: 'Launching $mission, resulted in $thrown', trace: '$trace');
    // we don't have the app state type here so cast to dynamic to acess
    // the error member then cast to the known type
    var reports = (state as DefaultErrorHandlingState).error.reports;
    var newReports = [report, ...reports];
    var stack = (state as dynamic).navigation.stack as List<PageState>;
    var newStack = [ErrorReportPageState(report), ...stack];

    /// Sections
    var newError = (state as DefaultErrorHandlingState)
        .error
        .copyWith(reports: newReports);
    var newNavigation = (state as dynamic).navigation.copyWith(stack: newStack);

    return (state as dynamic)
        .copyWith(error: newError, navigation: newNavigation) as S;
  }
}
