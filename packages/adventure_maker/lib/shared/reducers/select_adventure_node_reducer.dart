import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/challenges/models/challenges_state.dart';
import 'package:adventure_maker/shared/actions/select_adventure_node_action.dart';
import 'package:adventure_maker/steps/models/step_model.dart';
import 'package:adventure_maker/steps/models/steps_state.dart';
import 'package:adventure_maker/tasks/models/task_model.dart';
import 'package:adventure_maker/tasks/models/tasks_state.dart';
import 'package:redux/redux.dart';

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
