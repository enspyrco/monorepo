import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../challenges/models/challenge_model.dart';
import '../../steps/models/step_model.dart';
import '../../tasks/models/task_model.dart';

extension JsonListExtension on List<Document> {
  // Set<AdventureModel> toAdventures() => map<AdventureModel>(
  //     (Json json) => AdventureModel.fromJson(json as JsonMap)).toSet();

  Set<ChallengeModel> toChallenges() => {...map(ChallengeModel.fromDocument)};

  Set<TaskModel> toTasks() => {...map(TaskModel.fromDocument)};

  Set<StepModel> toSteps() => {...map(StepModel.fromDocument)};
}
