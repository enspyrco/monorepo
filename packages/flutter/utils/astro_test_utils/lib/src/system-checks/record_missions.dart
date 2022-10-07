import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';

/// We add a [RecordMissions] to [MissionControl.systemChecks] in [WidgetTestHarness]
/// so we can later check that missions were launched or landed.
class RecordMissions<T extends AstroState> extends SystemCheck<T> {
  final List<Mission> missions = [];

  @override
  void call(MissionControl<T> missionControl, Mission mission) async =>
      missions.add(mission);
}
