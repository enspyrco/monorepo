import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/state_types.dart';

class IdentityEquivalenceAppState implements AstroState, AppStateErrorHandling {
  IdentityEquivalenceAppState({required this.error});

  static IdentityEquivalenceAppState get initial =>
      IdentityEquivalenceAppState(error: DefaultErrorHandlingState.initial);

  @override
  final DefaultErrorHandlingState error;

  @override
  IdentityEquivalenceAppState copyWith({DefaultErrorHandlingState? error}) {
    return IdentityEquivalenceAppState(error: error ?? this.error);
  }

  @override
  toJson() => {'error': error.toJson()};
}
