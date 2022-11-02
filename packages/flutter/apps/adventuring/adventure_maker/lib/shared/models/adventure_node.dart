import 'package:astro_types/json_types.dart';

import '../../adventures/models/adventure_model.dart';
import '../../challenges/models/challenge_model.dart';
import '../../steps/models/step_model.dart';
import '../../tasks/models/task_model.dart';

abstract class AdventureNode {
  static String nextName(AdventureNode? node) => (node == null)
      ? 'adventure'
      : (node.isAdventure())
          ? 'challenge'
          : (node.isChallenge())
              ? 'task'
              : (node.isTask())
                  ? 'step'
                  : '?';

  String get name;
  String get typeName;
  JsonMap toJson();

  bool isAdventure() => typeName == AdventureModel.className;
  bool isChallenge() => typeName == ChallengeModel.className;
  bool isTask() => typeName == TaskModel.className;
  bool isStep() => typeName == StepModel.className;

  factory AdventureNode.fromJson(JsonMap json) {
    if (json['type'] == AdventureModel.className) {
      return AdventureModel.fromJson(json);
    }
    if (json['type'] == ChallengeModel.className) {
      return ChallengeModel.fromJson(json);
    }

    throw Exception('No entry for \'type\' ${json['type']}');
  }
}

// class AdventureNodeConverter implements JsonConverter<AdventureNode, JsonMap> {
//   const AdventureNodeConverter();



//   @override
//   JsonMap toJson(AdventureNode data) {
//     final json = data.toJson();
//     json['type'] = data.typeName;
//     return json;
//   }
// }
