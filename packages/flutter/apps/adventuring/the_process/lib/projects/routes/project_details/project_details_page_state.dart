import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class ProjectDetailsPageState<T extends AstroState>
    implements PageState, AstroState {
  const ProjectDetailsPageState();

  @override
  ProjectDetailsPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ProjectDetailsPageState'};
}
