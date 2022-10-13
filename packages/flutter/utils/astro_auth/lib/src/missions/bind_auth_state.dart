import 'dart:async';

import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import 'update_user_state.dart';

StreamSubscription<UserState>? _subscription;

class BindAuthState<T extends AstroState> extends AwayMission<T> {
  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    var service = locate<FirebaseAuthService>();

    _subscription?.cancel();

    _subscription = service
        .tapIntoAuthState()
        .listen((user) => missionControl.land(UpdateUserState<T>(user)));
  }

  @override
  JsonMap toJson() => {
        'name_': 'Bind Auth State',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': <String, dynamic>{}
      };
}
