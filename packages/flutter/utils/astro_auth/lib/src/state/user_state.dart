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
    this.photoUrl,
  });

  final SignedInState signedIn;
  final String? uid;
  final String? displayName;
  final String? photoUrl;

  static UserState get initial => UserState(signedIn: SignedInState.checking);

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
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  toJson() => <String, dynamic>{
        'signedIn': signedIn.name,
        'uid': uid,
        'displayName': displayName,
        'photoUrl': photoUrl,
      };

  @override
  bool operator ==(Object other) =>
      other is UserState &&
      other.signedIn == signedIn &&
      other.uid == uid &&
      other.displayName == displayName &&
      other.photoUrl == photoUrl;

  @override
  int get hashCode => Object.hash(signedIn, uid, displayName, photoUrl);
}
