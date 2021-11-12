import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/challenges/enums/challenge_task_progress_enum.dart';

part 'challenge_task_model.freezed.dart';
part 'challenge_task_model.g.dart';

@freezed
class ChallengeTaskModel with _$ChallengeTaskModel, ReduxModel {
  const factory ChallengeTaskModel({
    required String title,
    required String description,
    required ChallengeTaskProgressEnum progress,
    @ReduxActionConverter() ReduxAction? startAction,
    @ReduxActionConverter() ReduxAction? endAction,
  }) = _ChallengeTaskModel;

  factory ChallengeTaskModel.fromJson(JsonMap json) =>
      _$ChallengeTaskModelFromJson(json);
}
