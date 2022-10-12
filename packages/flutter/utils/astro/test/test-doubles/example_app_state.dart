import 'dart:collection';

import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/foundation.dart';

class ExampleAppState with AstroState, DefaultErrorHandlingState {
  ExampleAppState({required this.reports});

  static ExampleAppState get initial =>
      ExampleAppState(reports: UnmodifiableListView([]));

  @override
  final List<ErrorReport> reports;

  @override
  ExampleAppState copyWith({List<ErrorReport>? reports}) {
    return ExampleAppState(reports: reports ?? this.reports);
  }

  @override
  toJson() => {'reports': reports.map((e) => e.toJson()).toList()};

  @override
  bool operator ==(Object other) =>
      other is ExampleAppState && listEquals(other.reports, reports);

  @override
  int get hashCode => Object.hashAll(reports);
}
