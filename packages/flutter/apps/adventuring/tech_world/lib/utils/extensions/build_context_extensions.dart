import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:flutter/widgets.dart';

import '../../app/state/app_state.dart';

// Currently uses the locator meaning there is no need to use an extension
// on BuildContext, however doing so makes it a lot easier if we decide to
// change later (which is quite possible as using the locator seems to have some
// problems, eg. breaks hot reload)

extension BuildContextExtension on BuildContext {
  void land(LandingMission<AppState> mission) {
    return locate<MissionControl<AppState>>().land(mission);
  }

  Future<void> launch(AwayMission<AppState> mission) {
    return locate<MissionControl<AppState>>().launch(mission);
  }
}
