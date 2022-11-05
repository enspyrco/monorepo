import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/foundation.dart';

import 'error_report.dart';

class DefaultErrorHandlingState implements ErrorHandlingState, AstroState {
  const DefaultErrorHandlingState({required this.reports});

  static DefaultErrorHandlingState get initial =>
      const DefaultErrorHandlingState(reports: []);

  @override
  final List<DefaultErrorReport> reports;

  @override
  DefaultErrorHandlingState copyWith({List<DefaultErrorReport>? reports}) =>
      DefaultErrorHandlingState(reports: reports ?? this.reports);

  @override
  toJson() => {'reports': reports.map((e) => e.toJson()).toList()};

  @override
  bool operator ==(Object other) =>
      other is ErrorHandlingState && listEquals(other.reports, reports);

  @override
  int get hashCode => Object.hashAll(reports);
}
