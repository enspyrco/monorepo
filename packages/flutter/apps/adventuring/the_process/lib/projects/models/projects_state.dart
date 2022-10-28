import 'package:astro_types/state_types.dart';

import 'project_state.dart';

class ProjectsState with AstroState {
  ProjectsState({
    required this.all,
    required this.creating,
  });

  final Set<ProjectState> all;
  final bool creating;

  static ProjectsState get initial =>
      ProjectsState(all: Set(), creating: false);

  @override
  ProjectsState copyWith({Set<ProjectState>? all, bool? creating}) =>
      ProjectsState(
        all: all ?? this.all,
        creating: creating ?? this.creating,
      );

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
