import 'package:astro_types/auth_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firebase_auth_service_flutterfire/auth_state_flutterfire.dart';

class AstroAuthAppState implements AstroState, AppStateAuth {
  AstroAuthAppState({required this.auth});

  static AstroAuthAppState get initial =>
      AstroAuthAppState(auth: AuthStateFlutterfire());

  @override
  final AuthStateFlutterfire auth;

  @override
  AstroAuthAppState copyWith({AuthStateFlutterfire? auth}) {
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
