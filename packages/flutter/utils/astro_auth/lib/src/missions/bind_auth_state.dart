import 'dart:async';

import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:json_types/json_types.dart';
import 'package:locator/locator.dart';

import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import 'update_user_state.dart';

StreamSubscription<UserState>? _subscription;

class BindAuthState<T extends AstroState> extends AwayMission<T> {
  @override
  Future<void> flightPlan(AwayMissionControl<T> missionControl) async {
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
