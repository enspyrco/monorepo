import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:test/test.dart';

import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/actions/set_adventure_nodes_action.dart';
import 'package:adventure_maker/shared/reducers/set_adventure_nodes_reducer.dart';
import 'package:adventure_maker/steps/models/step_model.dart';
import 'package:adventure_maker/tasks/models/task_model.dart';

void main() {
  group('SetAdventureNodesReducer', () {
    test('correctly sets the nodes of a given type', () {
      ///////////////////////////////////////////////////
      /// adventures
      ///////////////////////////////////////////////////
      var adventure = const AdventureModel(id: 'id', name: 'name');
      var adventures = ISet([adventure]);
      var action = SetAdventureNodesAction(adventures);
      var state = AppState.init();

      expect(state.adventures.selected, null);
      expect(state.adventures.all, <AdventureModel>{});

      var newState = SetAdventureNodesReducer().reducer(state, action);

      expect(state.adventures.selected, null);
      expect(newState.adventures.all, adventures);

      ///////////////////////////////////////////////////
      /// challenges
      ///////////////////////////////////////////////////
      var challenge = const ChallengeModel(id: 'id', name: 'name');
      var challenges = ISet([challenge]);
      action = SetAdventureNodesAction(challenges);
      state = state.copyWith.adventures(selected: adventure);

      expect(state.challenges.selected, null);
      expect(state.challenges.all, <ChallengeModel>{});

      newState = SetAdventureNodesReducer().reducer(state, action);

      expect(state.challenges.selected, null);
      expect(newState.challenges.all, challenges);

      ///////////////////////////////////////////////////
      /// tasks
      ///////////////////////////////////////////////////
      var task = const TaskModel(id: 'id', name: 'name');
      var tasks = ISet([task]);
      action = SetAdventureNodesAction(tasks);
      state = state.copyWith.challenges(selected: challenge);

      expect(state.tasks.selected, null);
      expect(state.tasks.all, <TaskModel>{});

      newState = SetAdventureNodesReducer().reducer(state, action);

      expect(state.tasks.selected, null);
      expect(newState.tasks.all, tasks);

      ///////////////////////////////////////////////////
      /// steps
      ///////////////////////////////////////////////////
      var step = const StepModel(id: 'id', name: 'name');
      var steps = ISet(<StepModel>[step]);
      action = SetAdventureNodesAction(steps);
      state = state.copyWith.tasks(selected: task);

      expect(state.steps.selected, null);
      expect(state.steps.all, <StepModel>{});

      newState = SetAdventureNodesReducer().reducer(state, action);

      expect(state.steps.selected, null);
      expect(newState.steps.all, steps);
    });
  });
}
