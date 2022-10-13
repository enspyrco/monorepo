import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/state_types.dart';

class ExampleAppState with AstroState, DefaultErrorHandlingState {
  ExampleAppState({required this.error});

  static ExampleAppState get initial =>
      ExampleAppState(error: ErrorHandlingState.initial);

  @override
  final ErrorHandlingState error;

  @override
  ExampleAppState copyWith({ErrorHandlingState? error}) {
    return ExampleAppState(error: error ?? this.error);
  }

  @override
  toJson() => {'error': error.toJson()};

  @override
  bool operator ==(Object other) =>
      other is ExampleAppState && other.error == error;

  @override
  int get hashCode => error.hashCode;
}
