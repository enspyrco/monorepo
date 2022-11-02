import 'package:astro_types/core_types.dart';

import '../../_app/state/app_state.dart';
import '../../adventures/models/adventure_model.dart';
import '../../challenges/models/challenge_model.dart';
import '../../challenges/models/challenges_state.dart';
import '../../steps/models/step_model.dart';
import '../../steps/models/steps_state.dart';
import '../../tasks/models/task_model.dart';
import '../../tasks/models/tasks_state.dart';
import '../models/adventure_node.dart';

class SetAdventureNodeSelection extends LandingMission<AppState> {
  const SetAdventureNodeSelection(this.selection);

  final AdventureNode selection;

  @override
  AppState landingInstructions(AppState state) {
    var model = selection;
    if (model.isAdventure()) {
      return state.copyWith(
          adventures:
              state.adventures.copyWith(selected: selection as AdventureModel),
          challenges: ChallengesState.initial);
    }

    if (model.isChallenge()) {
      return state.copyWith(
          challenges:
              state.challenges.copyWith(selected: selection as ChallengeModel),
          tasks: TasksState.initial);
    }

    if (model.isTask()) {
      return state.copyWith(
          tasks: state.tasks.copyWith(selected: selection as TaskModel),
          steps: StepsState.initial);
    }

    if (model.isStep()) {
      return state.copyWith(
          steps: state.steps.copyWith(selected: selection as StepModel));
    }

    return state;
  }

  @override
  toJson() => {
        'name_': 'SetAdventureNodeSelection',
        'state_': {'selection': selection.toJson()}
      };
}
