import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/actions/select_adventure_node_action.dart';
import 'package:adventure_maker/shared/reducers/select_adventure_node_reducer.dart';
import 'package:adventure_maker/steps/models/step_model.dart';
import 'package:adventure_maker/tasks/models/task_model.dart';
import 'package:test/test.dart';

void main() {
  group('SelectAdventureNodeReducer', () {
    test('correctly sets the given node as the selected node', () {
      var state = AppState.init();
      ///////////////////////////////////////////////////
      /// adventure
      ///////////////////////////////////////////////////
      var adventure = const AdventureModel(id: 'id', name: 'name');
      var action = SelectAdventureNodeAction(adventure);

      expect(state.adventures.selected, null);

      state = SelectAdventureNodeReducer().reducer(state, action);

      expect(state.adventures.selected, adventure);

      ///////////////////////////////////////////////////
      /// challenge
      ///////////////////////////////////////////////////
      var challenge = const ChallengeModel(id: 'id', name: 'name');

      action = SelectAdventureNodeAction(challenge);

      expect(state.challenges.selected, null);

      state = SelectAdventureNodeReducer().reducer(state, action);

      expect(state.challenges.selected, challenge);

      ///////////////////////////////////////////////////
      /// task
      ///////////////////////////////////////////////////
      var task = const TaskModel(id: 'id', name: 'name');
      action = SelectAdventureNodeAction(task);

      expect(state.tasks.selected, null);

      state = SelectAdventureNodeReducer().reducer(state, action);

      expect(state.tasks.selected, task);

      ///////////////////////////////////////////////////
      /// step
      ///////////////////////////////////////////////////
      var step = const StepModel(id: 'id', name: 'name');
      action = SelectAdventureNodeAction(step);

      expect(state.steps.selected, null);

      state = SelectAdventureNodeReducer().reducer(state, action);

      expect(state.steps.selected, step);
    });
  });
}
