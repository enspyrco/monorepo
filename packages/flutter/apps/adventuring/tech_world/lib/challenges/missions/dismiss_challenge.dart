import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';

class DismissChallenge extends LandingMission<AppState> {
  const DismissChallenge();

  @override
  AppState landingInstructions(AppState state) {
    return state.copyWith(challenge: null);
  }

  @override
  toJson() => {'name_': 'DismissChallenge', 'state_': <String, dynamic>{}};
}
