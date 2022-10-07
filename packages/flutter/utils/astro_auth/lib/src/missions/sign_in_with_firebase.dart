import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_types/json_types.dart';
import 'package:locator/locator.dart';

import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import 'update_user_state.dart';

class SignInWithFirebase<T extends AstroState> extends AwayMission<T> {
  SignInWithFirebase({required this.idToken, required this.rawNonce});

  final String idToken;
  final String rawNonce;

  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    final service = locate<FirebaseAuthService>();

    UserCredential credential =
        await service.signInToFirebase(idToken, rawNonce);

    var user =
        credential.user ?? (throw 'Firebase Credential has no "user" member');
    var state = UserState(
        signedIn: SignedInState.signedIn,
        displayName: user.displayName,
        photoUrl: user.photoURL,
        uid: user.uid);

    missionControl.land(UpdateUserState<T>(state));
  }

  @override
  JsonMap toJson() => {
        'name_': 'Sign In With Firebase',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': <String, dynamic>{'idToken': idToken, 'rawNonce': rawNonce}
      };
}
