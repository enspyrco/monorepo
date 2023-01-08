import 'package:astro_types/auth_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firebase_auth_service_flutterfire/auth_state_flutterfire.dart';

class ExampleAppState implements AstroState, AppStateAuth {
  ExampleAppState({required this.auth});

  static ExampleAppState get initial =>
      ExampleAppState(auth: AuthStateFlutterfire());

  @override
  final AuthStateFlutterfire auth;

  @override
  ExampleAppState copyWith({AuthStateFlutterfire? auth}) {
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
