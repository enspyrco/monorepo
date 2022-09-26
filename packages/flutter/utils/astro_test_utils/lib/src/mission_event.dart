import 'package:astro/core/mission.dart';
import 'package:astro/core/root_state.dart';

class MissionEvent<T extends RootState> {
  MissionEvent(this.mission, this.state);
  final Mission mission;
  final T state;
}
