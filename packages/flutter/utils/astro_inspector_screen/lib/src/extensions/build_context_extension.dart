import 'package:astro/astro.dart' show DockingMission, AwayMission;
import 'package:astro_widgets/widgets/store_provider.dart' show StoreProvider;
import 'package:flutter/widgets.dart' show BuildContext;

import '../state/inspector_state.dart';

/// Syntax sugar for launching and landing astro missions
extension BuildContextExtension on BuildContext {
  void launch(AwayMission<InspectorState> mission) =>
      StoreProvider.of<InspectorState>(this).launch(mission);
  void land(DockingMission<InspectorState> mission) =>
      StoreProvider.of<InspectorState>(this).land(mission);
}
