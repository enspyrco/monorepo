import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../astro_error_handling.dart';

class CreateErrorReport<S extends AstroState> extends LandingMission<S> {
  const CreateErrorReport(this.error, this.trace);

  final Object error;
  final StackTrace trace;

  @override
  S landingInstructions(S state) {
    var report = DefaultErrorReport(
        message:
            'An error occurred:\n\n$error\n\nThe stacktrace is:\n\n$trace');
    // we don't have the app state type here so cast to dynamic to acess
    // the error member then cast to the known type
    var reports = (state as AppStateErrorHandling)
        .error
        .reports
        .cast<DefaultErrorReport>();
    var newReports = [report, ...reports];
    var stack = (state as dynamic).navigation.stack as List<PageState>;
    var newStack = [ErrorReportPageState(report), ...stack];

    /// Sections
    var newError = (state as dynamic).error.copyWith(reports: newReports);
    var newNavigation = (state as dynamic).navigation.copyWith(stack: newStack);

    return (state as dynamic)
        .copyWith(error: newError, navigation: newNavigation) as S;
  }

  @override
  toJson() => {
        'name_': 'CreateErrorReport',
        'state_': {'error': '$error', 'trace': '$trace'}
      };
}
