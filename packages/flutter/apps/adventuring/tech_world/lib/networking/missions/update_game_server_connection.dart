import 'dart:async';

import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../services/networking_service.dart';

StreamSubscription<Mission>? _subscription;

/// ConnectGameServer is launched when auth state changes to either signedIn
/// or notSignedIn. The [UpdateGameServerConnection.flightPlan] connects or disconnects
/// based on on the app state.
class UpdateGameServerConnection extends AwayMission<AppState> {
  const UpdateGameServerConnection();

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var service = locate<NetworkingService>();
    var state = missionControl.state;

    if (state.auth.user.signedIn == SignedInState.notSignedIn) {
      _subscription?.cancel();
      service.disconnect();
      return;
    }

    if (state.auth.user.signedIn == SignedInState.signedIn) {
      // listen to the networking service and dispatch any actions
      _subscription = service.missionsStream
          .listen(missionControl.land, onError: (Object error) => throw error);
      // ask the networking service to connect to the server
      service.connect(state.auth.user.uid!);
      return;
    }

    throw 'ConnectGameServer AwayMission was launched when state.auth.user.signedIn was ${state.auth.user.signedIn}.\n'
        'The mission assumes either SignedInState.signedIn or SignedInState.notSignedIn.\n'
        'Use the Inspector to determine what changed the state.';
  }

  @override
  toJson() => {'name_': 'ConnectGameServer', 'state_': <String, dynamic>{}};
}
