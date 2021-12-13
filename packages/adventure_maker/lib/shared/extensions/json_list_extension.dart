import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/types.dart';

import '../../adventures/models/adventure_model.dart';
import '../../challenges/models/challenge_model.dart';
import '../../steps/models/step_model.dart';
import '../../tasks/models/task_model.dart';

extension JsonListExtension on JsonList {
  ISet<AdventureModel> toAdventures() =>
      map<AdventureModel>((json) => AdventureModel.fromJson(json as JsonMap))
          .toISet();

  ISet<ChallengeModel> toChallenges() =>
      map<ChallengeModel>((json) => ChallengeModel.fromJson(json as JsonMap))
          .toISet();

  ISet<TaskModel> toTasks() =>
      map<TaskModel>((json) => TaskModel.fromJson(json as JsonMap)).toISet();

  ISet<StepModel> toSteps() =>
      map<StepModel>((json) => StepModel.fromJson(json as JsonMap)).toISet();
}
