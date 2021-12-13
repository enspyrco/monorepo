import 'package:redux/redux.dart';

import '../../adventures/models/adventure_model.dart';
import '../../app_state.dart';
import '../../challenges/models/challenge_model.dart';
import '../../challenges/models/challenges_state.dart';
import '../../steps/models/step_model.dart';
import '../../steps/models/steps_state.dart';
import '../../tasks/models/task_model.dart';
import '../../tasks/models/tasks_state.dart';
import '../actions/select_adventure_node_action.dart';

class SelectAdventureNodeReducer
    extends TypedReducer<AppState, SelectAdventureNodeAction> {
  SelectAdventureNodeReducer()
      : super((state, action) {
          var model = action.selection;
          if (model.isAdventure()) {
            return state.copyWith(
                adventures: state.adventures
                    .copyWith(selected: action.selection as AdventureModel),
                challenges: ChallengesState.init());
          }

          if (model.isChallenge()) {
            return state.copyWith(
                challenges: state.challenges
                    .copyWith(selected: action.selection as ChallengeModel),
                tasks: TasksState.init());
          }

          if (model.isTask()) {
            return state.copyWith(
                tasks: state.tasks
                    .copyWith(selected: action.selection as TaskModel),
                steps: StepsState.init());
          }

          if (model.isStep()) {
            return state.copyWith
                .steps(selected: action.selection as StepModel);
          }

          return state;
        });
}
