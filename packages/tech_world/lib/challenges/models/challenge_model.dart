import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/challenges/models/challenge_task_model.dart';

part 'challenge_model.freezed.dart';
part 'challenge_model.g.dart';

@freezed
class ChallengeModel with _$ChallengeModel, ReduxModel {
  const factory ChallengeModel(
      {required String repoUrl,
      required List<ChallengeTaskModel> tasks}) = _ChallengeModel;

  factory ChallengeModel.fromJson(JsonMap json) =>
      _$ChallengeModelFromJson(json);
}
