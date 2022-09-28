import 'package:astro/core/mission.dart';
import 'package:astro/core/root_state.dart';

class MissionUpdate<T extends RootState> {
  MissionUpdate(this.mission, this.state);
  final Mission mission;
  final T state;
}
