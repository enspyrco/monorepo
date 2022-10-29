import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

enum SignedInState {
  checking(true),
  notSignedIn(false),
  signingIn(true),
  signedIn(true);

  const SignedInState(this.disableButton);

  final bool disableButton;
}

class UserState with AstroState {
  UserState({
    required this.signedIn,
    this.uid,
    this.displayName,
    this.photoURL,
  });

  static UserState get initial => UserState(signedIn: SignedInState.checking);

  final SignedInState signedIn;
  final String? uid;
  final String? displayName;
  final String? photoURL;

  @override
  UserState copyWith({
    SignedInState? signedIn,
    String? uid,
    String? displayName,
    String? photoUrl,
  }) {
    return UserState(
      signedIn: signedIn ?? this.signedIn,
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      photoURL: photoUrl ?? photoURL,
    );
  }

  @override
  toJson() => <String, dynamic>{
        'signedIn': signedIn.name,
        'uid': uid,
        'displayName': displayName,
        'photoUrl': photoURL,
      };

  @override
  bool operator ==(Object other) =>
      other is UserState &&
      other.signedIn == signedIn &&
      other.uid == uid &&
      other.displayName == displayName &&
      other.photoURL == photoURL;

  @override
  int get hashCode => Object.hash(signedIn, uid, displayName, photoURL);
}

class AuthState extends AstroState {
  AuthState({required this.user});

  static AuthState get initial => AuthState(user: UserState.initial);

  final UserState user;

  @override
  AuthState copyWith({UserState? user}) => AuthState(user: user ?? this.user);

  @override
  JsonMap toJson() => {'user': user.toJson()};

  @override
  bool operator ==(Object other) => other is AuthState && other.user == user;

  @override
  int get hashCode => user.hashCode;
}
