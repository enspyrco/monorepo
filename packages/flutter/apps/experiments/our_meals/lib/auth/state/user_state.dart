import 'package:enspyr_redux/redux.dart';

enum SignedInState {
  checking(true),
  notSignedIn(false),
  signingIn(true),
  signedIn(true);

  const SignedInState(this.disableButton);

  final bool disableButton;
}

class UserState extends ReduxState {
  static UserState get initial => UserState(signedIn: SignedInState.checking);

  UserState(
      {required this.signedIn, this.uid, this.displayName, this.photoUrl});

  final SignedInState signedIn;
  final String? uid;
  final String? displayName;
  final String? photoUrl;

  UserState copyWith(
      {SignedInState? signedIn,
      String? uid,
      String? displayName,
      String? photoUrl}) {
    return UserState(
        signedIn: signedIn ?? this.signedIn,
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        photoUrl: photoUrl ?? this.photoUrl);
  }
}