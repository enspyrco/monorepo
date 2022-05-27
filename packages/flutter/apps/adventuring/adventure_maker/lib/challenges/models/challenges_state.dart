import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'challenge_model.dart';

part 'challenges_state.freezed.dart';
part 'challenges_state.g.dart';

@freezed
class ChallengesState with _$ChallengesState, ReduxState {
  static const String className = 'ChallengesState';

  const ChallengesState._();
  const factory ChallengesState(
      {ChallengeModel? selected,
      required ISet<ChallengeModel> all}) = _ChallengesState;

  factory ChallengesState.fromJson(JsonMap json) =>
      _$ChallengesStateFromJson(json);

  factory ChallengesState.init() => ChallengesState(all: ISet());

  @override
  String get typeName => className;
}
