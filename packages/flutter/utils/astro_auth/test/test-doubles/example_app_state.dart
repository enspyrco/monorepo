import 'package:astro_auth/astro_auth.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/state_types.dart';

class ExampleAppState implements AstroState, AppStateAuth {
  ExampleAppState({required this.auth});

  static ExampleAppState get initial =>
      ExampleAppState(auth: DefaultAuthState.initial);

  @override
  final DefaultAuthState auth;

  @override
  ExampleAppState copyWith({DefaultAuthState? auth}) {
    return ExampleAppState(auth: auth ?? this.auth);
  }

  @override
  toJson() => {'auth': auth.toJson()};

  @override
  bool operator ==(Object other) =>
      other is ExampleAppState && other.auth == auth;

  @override
  int get hashCode => auth.hashCode;
}
