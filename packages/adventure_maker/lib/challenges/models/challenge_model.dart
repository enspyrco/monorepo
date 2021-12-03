import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'challenge_model.freezed.dart';
part 'challenge_model.g.dart';

@freezed
class ChallengeModel with _$ChallengeModel, ReduxModel {
  const factory ChallengeModel({required String name}) = _ChallengeModel;

  factory ChallengeModel.fromJson(JsonMap json) =>
      _$ChallengeModelFromJson(json);
}
