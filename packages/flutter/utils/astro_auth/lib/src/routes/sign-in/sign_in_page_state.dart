import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class SignInPageState implements PageState, AstroState {
  const SignInPageState();

  @override
  SignInPageState copyWith() => this;

  @override
  toJson() => {'type': 'SignInPageState'};
}
