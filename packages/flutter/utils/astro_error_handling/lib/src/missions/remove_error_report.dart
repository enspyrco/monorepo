import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../astro_error_handling.dart';

class RemoveErrorReport<S extends AstroState> extends LandingMission<S> {
  const RemoveErrorReport(this.report);

  final DefaultErrorReport report;

  @override
  S landingInstructions(S state) {
    /// Get the relevant pieces of state out of the app state
    var error = (state as AppStateErrorHandling).error;
    var stack = (state as dynamic).navigation.stack as List<PageState>;

    /// Create new state
    var newReports =
        ([...error.reports]..remove(report)).cast<DefaultErrorReport>();
    var newStack = [...stack]..remove(ErrorReportPageState(report));

    /// Update sections
    var newError = (error as dynamic).copyWith(reports: newReports);
    var newNavigation = (state as dynamic).navigation.copyWith(stack: newStack);

    /// Update the app state
    return (state as dynamic)
        .copyWith(error: newError, navigation: newNavigation) as S;
  }

  @override
  toJson() => {'name_': 'RemoveErrorReport', 'state_': <String, dynamic>{}};
}
