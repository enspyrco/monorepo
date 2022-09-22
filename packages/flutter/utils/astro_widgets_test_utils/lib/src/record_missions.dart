import 'package:astro/astro.dart';

/// We add a [RecordMissions] to [MissionControl.systemChecks] in [WidgetTestHarness]
/// so we can later check that missions were launched or landed.
class RecordMissions<T extends RootState> extends SystemCheck<T> {
  final List<Mission> missions = [];

  @override
  void call(MissionControl<T> missionControl, Mission mission) async =>
      missions.add(mission);
}
