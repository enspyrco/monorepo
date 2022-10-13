import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/state_types.dart';

class IdentityEquivalenceAppState with AstroState, DefaultErrorHandlingState {
  IdentityEquivalenceAppState({required this.error});

  static IdentityEquivalenceAppState get initial =>
      IdentityEquivalenceAppState(error: ErrorHandlingState.initial);

  @override
  final ErrorHandlingState error;

  @override
  IdentityEquivalenceAppState copyWith({ErrorHandlingState? error}) {
    return IdentityEquivalenceAppState(error: error ?? this.error);
  }

  @override
  toJson() => {'error': error.toJson()};
}
