import 'package:astro_types/core_types.dart';

import '../../_app/state/app_state.dart';
import '../../adventures/models/adventure_model.dart';
import '../../challenges/models/challenge_model.dart';
import '../../steps/models/step_model.dart';
import '../../tasks/models/task_model.dart';

class SetAdventureNodes extends LandingMission<AppState> {
  const SetAdventureNodes(this.list);

  final Set<dynamic> list;

  @override
  AppState landingInstructions(AppState state) {
    if (state.adventures.selected == null) {
      return state.copyWith(
          adventures:
              state.adventures.copyWith(all: list as Set<AdventureModel>?));
    }

    if (state.challenges.selected == null) {
      return state.copyWith(
          challenges:
              state.challenges.copyWith(all: list as Set<ChallengeModel>?));
    }

    if (state.tasks.selected == null) {
      return state.copyWith(
          tasks: state.tasks.copyWith(all: list as Set<TaskModel>?));
    }

    if (state.steps.selected == null) {
      return state.copyWith(
          steps: state.steps.copyWith(all: list as Set<StepModel>?));
    }

    return state;
  }

  @override
  toJson() => {
        'name_': 'SetAdventureNodes',
        'state_': {
          'list': [...list.map((e) => e.toJson())]
        },
      };
}
