import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/challenges/enums/challenge_enum.dart';

part 'start_challenge_action.freezed.dart';
part 'start_challenge_action.g.dart';

@freezed
class StartChallengeAction with _$StartChallengeAction, ReduxAction {
  const StartChallengeAction._();
  const factory StartChallengeAction(ChallengeEnum challengeType) =
      _StartChallengeAction;

  factory StartChallengeAction.fromJson(JsonMap json) =>
      _$StartChallengeActionFromJson(json);

  @override
  String get typeName => 'StartChallengeAction';
}
