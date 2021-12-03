import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/models/step_model.dart';
import 'package:adventure_maker/models/task_model.dart';

class Selections {
  Selections(this.adventure, this.challenge, this.task, this.step);
  AdventureModel? adventure;
  ChallengeModel? challenge;
  TaskModel? task;
  StepModel? step;

  String get leafName => (adventure == null)
      ? 'adventure'
      : (challenge == null)
          ? 'challenge'
          : (task == null)
              ? 'task'
              : 'step';
}
