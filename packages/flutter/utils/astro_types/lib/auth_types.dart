import 'json_types.dart';
import 'state_types.dart';

abstract class AppStateAuth {
  abstract final AuthState auth;
}

/// [AuthState] is a state section, being the state object of a plugin, in this case
/// the astro_auth plugin. Currently the section only holds the user's auth state
/// in a single [UserAuthState] member, but the section may expand over time.
abstract class AuthState implements AstroState {
  UserAuthState get user;

  @override
  AuthState copyWith({UserAuthState? user});

  @override
  JsonMap toJson();
}

/// [UserAuthState] holds authorization & authentication state associated with
/// a particular user.
abstract class UserAuthState implements AstroState {
  SignedInState get signedIn;
  String? get uid;
  String? get displayName;
  String? get photoURL;

  @override
  UserAuthState copyWith({
    SignedInState? signedIn,
    String? uid,
    String? displayName,
    String? photoURL,
  });

  @override
  JsonMap toJson();
}

enum SignedInState {
  checking(true),
  notSignedIn(false),
  signingIn(true),
  signedIn(true);

  const SignedInState(this.disableButton);

  final bool disableButton;
}
