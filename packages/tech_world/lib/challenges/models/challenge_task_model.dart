import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'challenge_task_model.freezed.dart';
part 'challenge_task_model.g.dart';

@freezed
class ChallengeTaskModel with _$ChallengeTaskModel, ReduxModel {
  static const String className = 'ChallengeTaskModel';

  const ChallengeTaskModel._();
  const factory ChallengeTaskModel({
    required String title,
    required String description,

    /// null = not started, false = in progress, true = complete
    bool? complete,
    @ReduxActionConverter() ReduxAction? startAction,
    @ReduxActionConverter() ReduxAction? endAction,
  }) = _ChallengeTaskModel;

  factory ChallengeTaskModel.fromJson(JsonMap json) =>
      _$ChallengeTaskModelFromJson(json);

  @override
  String get typeName => className;
}
