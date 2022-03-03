import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redux/redux.dart';

import '../../adventures/models/adventure_model.dart';
import '../../app_state.dart';
import '../../challenges/models/challenge_model.dart';
import '../../steps/models/step_model.dart';
import '../../tasks/models/task_model.dart';
import '../actions/set_adventure_nodes_action.dart';

class SetAdventureNodesReducer
    extends TypedReducer<AppState, SetAdventureNodesAction> {
  SetAdventureNodesReducer()
      : super((state, action) {
          if (state.adventures.selected == null) {
            return state.copyWith
                .adventures(all: action.list as ISet<AdventureModel>);
          }

          if (state.challenges.selected == null) {
            return state.copyWith
                .challenges(all: action.list as ISet<ChallengeModel>);
          }

          if (state.tasks.selected == null) {
            return state.copyWith.tasks(all: action.list as ISet<TaskModel>);
          }

          if (state.steps.selected == null) {
            return state.copyWith.steps(all: action.list as ISet<StepModel>);
          }

          return state;
        });
}
