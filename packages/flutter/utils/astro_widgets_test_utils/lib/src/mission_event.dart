import 'package:astro/astro.dart';

class MissionEvent<T extends RootState> {
  MissionEvent(this.mission, this.state);
  final Mission mission;
  final T state;
}
