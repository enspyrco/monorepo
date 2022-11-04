import 'package:adventure_maker/_app/state/app_state.dart';
import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/missions/set_adventure_node_selection.dart';
import 'package:adventure_maker/steps/models/step_model.dart';
import 'package:adventure_maker/tasks/models/task_model.dart';
import 'package:test/test.dart';

void main() {
  group('SetAdventureNodeSelection', () {
    test('correctly sets the given node as the selected node', () {
      var state = AppState.initial;
      ///////////////////////////////////////////////////
      /// adventure
      ///////////////////////////////////////////////////
      var adventure = const AdventureModel(id: 'id', name: 'name');
      var mission = SetAdventureNodeSelection(adventure);

      expect(state.adventures.selected, null);

      state = mission.landingInstructions(state);

      expect(state.adventures.selected, adventure);

      ///////////////////////////////////////////////////
      /// challenge
      ///////////////////////////////////////////////////
      var challenge = const ChallengeModel(id: 'id', name: 'name');

      mission = SetAdventureNodeSelection(challenge);

      expect(state.challenges.selected, null);

      state = mission.landingInstructions(state);

      expect(state.challenges.selected, challenge);

      ///////////////////////////////////////////////////
      /// task
      ///////////////////////////////////////////////////
      var task = const TaskModel(id: 'id', name: 'name');
      mission = SetAdventureNodeSelection(task);

      expect(state.tasks.selected, null);

      state = mission.landingInstructions(state);

      expect(state.tasks.selected, task);

      ///////////////////////////////////////////////////
      /// step
      ///////////////////////////////////////////////////
      var step = const StepModel(id: 'id', name: 'name');
      mission = SetAdventureNodeSelection(step);

      expect(state.steps.selected, null);

      state = mission.landingInstructions(state);

      expect(state.steps.selected, step);
    });
  });
}
