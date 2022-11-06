import 'package:ws_game_server_types/ws_game_server_types.dart';

import 'challenge_task_model.dart';

typedef ChallengeModelFromJson = ChallengeModel Function(JsonMap json);

mixin ChallengeModel {
  JsonMap toJson();
  String get typeName;
  List<ChallengeTaskModel> get tasks;
}

// final _fromJsonMap = <String, ChallengeModelFromJson>{};

// ChallengeModel fromJson(JsonMap json) {
//   final fromJson = _fromJsonMap[json['type']];
//   if (fromJson == null) {
//     throw Exception('No entry for \'type\' ${json['type']}');
//   }
//   return fromJson(json);
// }

// JsonMap toJson(ChallengeModel? data) {
//   final json = data?.toJson();
//   json?['type'] = data?.typeName;
//   return json ?? {};
// }
