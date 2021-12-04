import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/state/adventure_subtree.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'challenges_state.freezed.dart';
part 'challenges_state.g.dart';

@freezed
class ChallengesState
    with _$ChallengesState, ReduxModel, AdventureSubtree<ChallengeModel> {
  static const String className = 'ChallengesState';

  const ChallengesState._();
  const factory ChallengesState(
      ISet<ChallengeModel> list, ChallengeModel? selected) = _ChallengesState;

  factory ChallengesState.fromJson(JsonMap json) =>
      _$ChallengesStateFromJson(json);

  factory ChallengesState.init() => ChallengesState(ISet(), null);

  @override
  String get typeName => className;
}
