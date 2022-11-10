import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

class MissionReport<T extends AstroState> {
  MissionReport(this.mission, this.state);
  final Mission mission;
  final T state;
}
