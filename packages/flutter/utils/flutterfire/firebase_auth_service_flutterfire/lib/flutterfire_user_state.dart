import 'package:astro_types/auth_types.dart';
import 'package:astro_types/state_types.dart';

class FlutterfireUserState implements UserAuthState, AstroState {
  FlutterfireUserState({
    required this.signedIn,
    this.uid,
    this.displayName,
    this.photoURL,
  });

  static FlutterfireUserState get initial =>
      FlutterfireUserState(signedIn: SignedInState.checking);

  @override
  final SignedInState signedIn;
  @override
  final String? uid;
  @override
  final String? displayName;
  @override
  final String? photoURL;

  @override
  FlutterfireUserState copyWith({
    SignedInState? signedIn,
    String? uid,
    String? displayName,
    String? photoUrl,
  }) {
    return FlutterfireUserState(
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
      other is FlutterfireUserState &&
      other.signedIn == signedIn &&
      other.uid == uid &&
      other.displayName == displayName &&
      other.photoURL == photoURL;

  @override
  int get hashCode => Object.hash(signedIn, uid, displayName, photoURL);
}
