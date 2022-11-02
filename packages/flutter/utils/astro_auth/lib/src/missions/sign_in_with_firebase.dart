import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import '../services/firebase_auth_service.dart';

class SignInWithFirebase<T extends AstroState> extends AwayMission<T> {
  const SignInWithFirebase({
    required this.idToken,
    required this.rawNonce,
  });

  final String idToken;
  final String rawNonce;

  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    final service = locate<FirebaseAuthService>();

    /// We just sign in here, adding the user data to the app state happens where
    /// the "auth state changed" event is handled - in [BindAuthState.flightPlan]
    await service.signInToFirebase(idToken, rawNonce);
  }

  @override
  JsonMap toJson() => {
        'name_': 'Sign In With Firebase',
        'state_': <String, dynamic>{
          'idToken': idToken,
          'rawNonce': rawNonce,
        }
      };
}
