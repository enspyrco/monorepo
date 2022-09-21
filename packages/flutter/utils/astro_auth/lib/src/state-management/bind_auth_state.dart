import 'dart:async';

import 'package:astro/astro.dart';
import 'package:json_types/json_types.dart';
import 'package:locator/locator.dart';

import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import 'update_user_state.dart';

StreamSubscription<UserState>? _subscription;

class BindAuthState<T extends RootState> extends AwayMission<T> {
  @override
  Future<void> flightPlan(MissionControl store) async {
    var service = locate<FirebaseAuthService>();

    _subscription?.cancel();

    _subscription = service
        .tapIntoAuthState()
        .listen((user) => store.land(UpdateUserState<T>(user)..parent = this));
  }

  @override
  JsonMap toJson({int? parentId}) => {
        'name_': 'Bind Auth State',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId,
        'state_': <String, dynamic>{}
      };
}
