import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../state/models/error_report.dart';

class ErrorReportPageState<T extends AstroState>
    implements PageState, AstroState {
  const ErrorReportPageState(this.report);

  final DefaultErrorReport report;

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
