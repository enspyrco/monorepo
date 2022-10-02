import 'package:astro/widgets/mission_control_provider.dart';
import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:flutter/widgets.dart' show BuildContext;

import '../state/inspector_state.dart';

/// Syntax sugar for launching and landing astro missions
extension BuildContextExtension on BuildContext {
  void launch(AwayMission<InspectorState> mission) =>
      MissionControlProvider.of<InspectorState>(this).launch(mission);
  void land(LandingMission<InspectorState> mission) =>
      MissionControlProvider.of<InspectorState>(this).land(mission);
}
