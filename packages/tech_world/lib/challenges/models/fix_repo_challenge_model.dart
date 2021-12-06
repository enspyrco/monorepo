import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/challenges/models/challenge_model.dart';
import 'package:tech_world/challenges/models/challenge_task_model.dart';

part 'fix_repo_challenge_model.freezed.dart';
part 'fix_repo_challenge_model.g.dart';

@freezed
class FixRepoChallengeModel
    with _$FixRepoChallengeModel, ChallengeModel, ReduxState {
  const FixRepoChallengeModel._();
  const factory FixRepoChallengeModel(
      {required String repoUrl,
      required List<ChallengeTaskModel> tasks}) = _FixRepoChallengeModel;

  factory FixRepoChallengeModel.fromJson(JsonMap json) =>
      _$FixRepoChallengeModelFromJson(json);

  @override
  String get typeName => 'FixRepoChallengeModel';
}
