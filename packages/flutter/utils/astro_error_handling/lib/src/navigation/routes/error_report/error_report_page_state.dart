import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../../state/models/error_report.dart';

class ErrorReportPageState<T extends AstroState> with PageState, AstroState {
  ErrorReportPageState(this.report);

  final ErrorReport report;

  @override
  ErrorReportPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ErrorReportPageState'};

  @override
  bool operator ==(Object other) =>
      other is ErrorReportPageState && other.report == report;

  @override
  int get hashCode => report.hashCode;
}