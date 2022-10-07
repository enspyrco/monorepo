import 'dart:collection';

import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_state_interface/astro_state_interface.dart';

class ExampleAppState with AstroState, ErrorHandlingState {
  ExampleAppState({required this.errorMessages});

  static ExampleAppState get initial =>
      ExampleAppState(errorMessages: UnmodifiableListView([]));

  @override
  final List<ErrorReport> errorMessages;

  @override
  ExampleAppState copyWith({List<ErrorReport>? errorMessages}) {
    return ExampleAppState(errorMessages: errorMessages ?? this.errorMessages);
  }

  @override
  toJson() => {'errorMessages': errorMessages.map((e) => e.toJson()).toList()};
}
