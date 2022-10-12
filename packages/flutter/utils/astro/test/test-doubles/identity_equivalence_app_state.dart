import 'dart:collection';

import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/state_types.dart';

class IdentityEquivalenceAppState with AstroState, DefaultErrorHandlingState {
  IdentityEquivalenceAppState({required this.reports});

  static IdentityEquivalenceAppState get initial =>
      IdentityEquivalenceAppState(reports: UnmodifiableListView([]));

  @override
  final List<ErrorReport> reports;

  @override
  IdentityEquivalenceAppState copyWith({List<ErrorReport>? reports}) {
    return IdentityEquivalenceAppState(reports: reports ?? this.reports);
  }

  @override
  toJson() => {'reports': reports.map((e) => e.toJson()).toList()};
}
