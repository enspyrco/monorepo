import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';

class MissionUpdate<T extends AstroState> {
  MissionUpdate(this.mission, this.state);
  final Mission mission;
  final T state;
}
