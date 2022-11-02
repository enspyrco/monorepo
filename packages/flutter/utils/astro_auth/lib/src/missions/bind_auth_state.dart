import 'dart:async';

import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import '../utils/on_signed_in_missions.dart';
import 'update_user_state.dart';

StreamSubscription<UserState>? _subscription;

class BindAuthState<T extends AstroState> extends AwayMission<T> {
  const BindAuthState();

  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    var service = locate<FirebaseAuthService>();

    _subscription?.cancel();

    _subscription = service.tapIntoAuthState().listen((user) {
      missionControl.land(UpdateUserState<T>(user));

      /// Start any missions that were added to [OnAuthStateChangeMissions].
      ///
      /// [AwayMission]s, which are async, are launched before [LandingMission]s
      /// so the [AwayMission]s aren't held up by the [LandingMission]s.
      final onAuthStateChangedMissions = locate<OnAuthStateChangeMissions<T>>();
      if (user.signedIn == SignedInState.signedIn) {
        for (var mission in onAuthStateChangedMissions.launchOnSignedIn) {
          missionControl.launch(mission);
        }
        for (var mission in onAuthStateChangedMissions.landOnSignedIn) {
          missionControl.land(mission);
        }
      } else if (user.signedIn == SignedInState.notSignedIn) {
        for (var mission in onAuthStateChangedMissions.launchOnSignedOut) {
          missionControl.launch(mission);
        }
        for (var mission in onAuthStateChangedMissions.landOnSignedOut) {
          missionControl.land(mission);
        }
      }
    });
  }

  @override
  JsonMap toJson() =>
      {'name_': 'Bind Auth State', 'state_': <String, dynamic>{}};
}
