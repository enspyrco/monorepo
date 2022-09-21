import 'package:astro/astro.dart' show DockingMission, AwayMission;
import 'package:astro_widgets/widgets/store_provider.dart' show StoreProvider;
import 'package:flutter/widgets.dart' show BuildContext;

import '../state/dev_tools_state.dart';

/// Syntax sugar for launching and landing astro missions
extension BuildContextExtension on BuildContext {
  void launch(AwayMission<DevToolsState> mission) =>
      StoreProvider.of<DevToolsState>(this).launch(mission);
  void land(DockingMission<DevToolsState> mission) =>
      StoreProvider.of<DevToolsState>(this).land(mission);
}
