import 'package:astro_types/state_types.dart';
import 'package:flutter/foundation.dart';

import 'error_report.dart';

class ErrorHandlingState implements AstroState {
  const ErrorHandlingState({required this.reports});

  static ErrorHandlingState get initial =>
      const ErrorHandlingState(reports: []);

  final List<ErrorReport> reports;

  @override
  ErrorHandlingState copyWith({List<ErrorReport>? reports}) =>
      ErrorHandlingState(reports: reports ?? this.reports);

  @override
  toJson() => {'reports': reports.map((e) => e.toJson()).toList()};

  @override
  bool operator ==(Object other) =>
      other is ErrorHandlingState && listEquals(other.reports, reports);

  @override
  int get hashCode => Object.hashAll(reports);
}
