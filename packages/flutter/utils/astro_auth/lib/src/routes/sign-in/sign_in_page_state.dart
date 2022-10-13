import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class SignInPageState with PageState, AstroState {
  @override
  SignInPageState copyWith() => this;

  @override
  toJson() => {'type': 'SignInPageState'};
}
