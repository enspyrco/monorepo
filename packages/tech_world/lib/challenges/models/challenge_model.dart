import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_world/challenges/models/challenge_task_model.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

typedef ChallengeModelFromJson = ChallengeModel Function(JsonMap json);

mixin ChallengeModel {
  JsonMap toJson();
  String get typeName;
  List<ChallengeTaskModel> get tasks;
}

final _fromJsonMap = <String, ChallengeModelFromJson>{};

class ChallengeModelConverter
    implements JsonConverter<ChallengeModel?, JsonMap> {
  const ChallengeModelConverter();

  @override
  ChallengeModel fromJson(JsonMap json) {
    final fromJson = _fromJsonMap[json['type']];
    if (fromJson == null) {
      throw Exception('No entry for \'type\' ${json['type']}');
    }
    return fromJson(json);
  }

  @override
  JsonMap toJson(ChallengeModel? data) {
    final json = data?.toJson();
    json?['type'] = data?.typeName;
    return json ?? {};
  }
}
