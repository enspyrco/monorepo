import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class AuthCheckPageState with PageState, AstroState {
  @override
  AuthCheckPageState copyWith() => this;

  @override
  toJson() => {'type': 'AuthCheckPageState'};
}
