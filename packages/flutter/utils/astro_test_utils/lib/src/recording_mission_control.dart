import 'package:astro/astro.dart';
import 'package:astro_test_utils/src/system-checks/record_missions.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

class RecordingMissionControl<T extends AstroState>
    implements MissionControl<T> {
  RecordingMissionControl({required T state}) {
    _missionControl = DefaultMissionControl<T>(
        state: state, systemChecks: [_recordedMissions]);
  }
  late final MissionControl<T> _missionControl;
  final RecordMissions<T> _recordedMissions = RecordMissions<T>();

  @override
  void land(LandingMission<T> mission) => _missionControl.land(mission);

  @override
  Future<void> launch(AwayMission<T> mission) =>
      _missionControl.launch(mission);

  @override
  Stream<T> get onStateChange => _missionControl.onStateChange;

  @override
  T get state => _missionControl.state;
}
