import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../../astro_error_handling.dart';

class ErrorReportPageState<T extends AstroState> with PageState, AstroState {
  ErrorReportPageState(this.report);

  final ErrorReport report;

  @override
  ErrorReportPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ErrorReportPageState'};
}
