import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:flutter/widgets.dart';

import '../app/state/app_state.dart';

extension BuildContextExtension on BuildContext {
  void land(LandingMission<AppState> mission) {
    return locate<MissionControl<AppState>>().land(mission);
  }

  Future<void> launch(AwayMission<AppState> mission) {
    return locate<MissionControl<AppState>>().launch(mission);
  }
}
