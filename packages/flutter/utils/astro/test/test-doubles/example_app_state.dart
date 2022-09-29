import 'dart:collection';

import 'package:astro/astro.dart';
import 'package:astro_error_handling/astro_error_handling.dart';

class ExampleAppState extends RootState {
  ExampleAppState({required this.errorMessages});

  static ExampleAppState get initial =>
      ExampleAppState(errorMessages: UnmodifiableListView([]));

  @override
  final List<ErrorMessage> errorMessages;

  @override
  ExampleAppState copyWith({List<ErrorMessage>? errorMessages}) {
    return ExampleAppState(errorMessages: errorMessages ?? this.errorMessages);
  }

  @override
  toJson() => {'errorMessages': errorMessages.map((e) => e.toJson()).toList()};
}
