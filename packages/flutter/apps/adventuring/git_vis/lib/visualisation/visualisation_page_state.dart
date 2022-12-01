import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class VisualisationPageState<T extends AstroState>
    implements PageState, AstroState {
  const VisualisationPageState();

  @override
  VisualisationPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'VisualisationPageState'};
}
