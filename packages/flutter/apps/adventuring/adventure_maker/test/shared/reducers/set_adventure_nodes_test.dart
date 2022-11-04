import 'package:adventure_maker/_app/state/app_state.dart';
import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/missions/set_adventure_nodes.dart';
import 'package:adventure_maker/steps/models/step_model.dart';
import 'package:adventure_maker/tasks/models/task_model.dart';
import 'package:test/test.dart';

void main() {
  group('SetAdventureNodes', () {
    test('correctly sets the nodes of a given type', () {
      ///////////////////////////////////////////////////
      /// adventures
      ///////////////////////////////////////////////////
      var adventure = const AdventureModel(id: 'id', name: 'name');
      var adventures = {adventure};
      var mission = SetAdventureNodes(adventures);
      var state = AppState.initial;

      expect(state.adventures.selected, null);
      expect(state.adventures.all, <AdventureModel>{});

      state = mission.landingInstructions(state);

      expect(state.adventures.selected, null);
      expect(state.adventures.all, adventures);

      ///////////////////////////////////////////////////
      /// challenges
      ///////////////////////////////////////////////////
      var challenge = const ChallengeModel(id: 'id', name: 'name');
      var challenges = {challenge};
      mission = SetAdventureNodes(challenges);
      state = state.copyWith(
          adventures: state.adventures.copyWith(selected: adventure));

      expect(state.challenges.selected, null);
      expect(state.challenges.all, <ChallengeModel>{});

      state = mission.landingInstructions(state);

      expect(state.challenges.selected, null);
      expect(state.challenges.all, challenges);

      ///////////////////////////////////////////////////
      /// tasks
      ///////////////////////////////////////////////////
      var task = const TaskModel(id: 'id', name: 'name');
      var tasks = {task};
      mission = SetAdventureNodes(tasks);

      state = state.copyWith(
          challenges: state.challenges.copyWith(selected: challenge));

      expect(state.tasks.selected, null);
      expect(state.tasks.all, <TaskModel>{});

      state = mission.landingInstructions(state);

      expect(state.tasks.selected, null);
      expect(state.tasks.all, tasks);

      ///////////////////////////////////////////////////
      /// steps
      ///////////////////////////////////////////////////
      var step = const StepModel(id: 'id', name: 'name');
      var steps = {step};
      mission = SetAdventureNodes(steps);
      state = state.copyWith(tasks: state.tasks.copyWith(selected: task));

      expect(state.steps.selected, null);
      expect(state.steps.all, <StepModel>{});

      state = mission.landingInstructions(state);

      expect(state.steps.selected, null);
      expect(state.steps.all, steps);
    });
  });
}
