import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

abstract class AdventureNode {
  String get name;
  String get typeName;
  JsonMap toJson();
  bool isAdventure() => typeName == AdventureModel.className;
  bool isChallenge() => typeName == ChallengeModel.className;
}

class AdventureNodeConverter implements JsonConverter<AdventureNode, JsonMap> {
  const AdventureNodeConverter();

  @override
  AdventureNode fromJson(JsonMap json) {
    if (json['type'] == AdventureModel.className) {
      return AdventureModel.fromJson(json);
    }
    if (json['type'] == ChallengeModel.className) {
      return ChallengeModel.fromJson(json);
    }

    throw Exception('No entry for \'type\' ${json['type']}');
  }

  @override
  JsonMap toJson(AdventureNode data) {
    final json = data.toJson();
    json['type'] = data.typeName;
    return json;
  }
}
