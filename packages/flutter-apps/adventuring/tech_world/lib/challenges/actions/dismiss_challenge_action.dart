import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'dismiss_challenge_action.freezed.dart';
part 'dismiss_challenge_action.g.dart';

@freezed
class DismissChallengeAction with _$DismissChallengeAction, ReduxAction {
  const DismissChallengeAction._();
  const factory DismissChallengeAction() = _DismissChallengeAction;

  factory DismissChallengeAction.fromJson(JsonMap json) =>
      _$DismissChallengeActionFromJson(json);

  @override
  String get typeName => 'DismissChallengeAction';
}
