import 'package:astro/astro.dart';
import 'package:json_types/json_types.dart';
import 'package:locator/locator.dart';

import '../services/firebase_auth_service.dart';

class SignOut<T extends RootState> extends AwayMission<T> {
  @override
  Future<void> flightPlan(AwayMissionControl<T> missionControl) async {
    var service = locate<FirebaseAuthService>();
    await service.signOut();
  }

  @override
  JsonMap toJson() => {
        'name_': 'Sign Out',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': <String, dynamic>{}
      };
}
