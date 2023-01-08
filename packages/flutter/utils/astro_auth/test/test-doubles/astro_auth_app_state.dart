import 'package:astro_types/auth_types.dart';
import 'package:astro_types/state_types.dart';

class AstroAuthAppState implements AstroState, AppStateAuth {
  AstroAuthAppState({required this.auth});

  static AstroAuthAppState get initial =>
      AstroAuthAppState(auth: AuthState.initial);

  @override
  final AuthState auth;

  @override
  AstroAuthAppState copyWith({AuthState? auth}) {
    return AstroAuthAppState(auth: auth ?? this.auth);
  }

  @override
  toJson() => {'auth': auth.toJson()};

  @override
  bool operator ==(Object other) =>
      other is AstroAuthAppState && other.auth == auth;

  @override
  int get hashCode => auth.hashCode;
}
