import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class AuthGatePageState implements PageState, AstroState {
  const AuthGatePageState();

  @override
  AuthGatePageState copyWith() => this;

  @override
  toJson() => {'type': 'AuthGatePageState'};
}
