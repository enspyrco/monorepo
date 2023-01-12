// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_state.dart';

// **************************************************************************
// StateImplementationGenerator
// **************************************************************************

class UserAuthStateTestDouble implements UserAuthState {
  UserAuthStateTestDouble({
    required this.signedIn,
    this.uid,
    this.displayName,
    this.photoURL,
  });

  @override
  final SignedInState signedIn;

  @override
  final String? uid;

  @override
  final String? displayName;

  @override
  final String? photoURL;

  @override
  UserAuthStateTestDouble copyWith({
    SignedInState? signedIn,
    String? uid,
    String? displayName,
    String? photoURL,
  }) =>
      UserAuthStateTestDouble(
        signedIn: signedIn ?? this.signedIn,
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        photoURL: photoURL ?? this.photoURL,
      );

  @override
  Map<String, Object?> toJson() => {
        'signedIn': signedIn,
        'uid': uid,
        'displayName': displayName,
        'photoURL': photoURL,
      };

  @override
  String toString() => 'signedIn: $signedIn, '
      'uid: $uid, '
      'displayName: $displayName, '
      'photoURL: $photoURL, ';

  @override
  int get hashCode => Object.hash(
        signedIn,
        uid,
        displayName,
        photoURL,
      );

  @override
  bool operator ==(Object other) =>
      other is UserAuthStateTestDouble &&
      signedIn == other.signedIn &&
      uid == other.uid &&
      displayName == other.displayName &&
      photoURL == other.photoURL;
}
