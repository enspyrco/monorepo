import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'challenge_model.dart';

class ChallengesState implements AstroState {
  ChallengesState({this.selected, required this.all});

  final ChallengeModel? selected;
  final Set<ChallengeModel> all;

  factory ChallengesState.fromJson(JsonMap json) => ChallengesState(
      all: (json['all'] as List)
          .map((e) => ChallengeModel.fromJson(e as JsonMap))
          .toSet());

  static ChallengesState get initial =>
      ChallengesState(all: <ChallengeModel>{});

  @override
  ChallengesState copyWith({
    ChallengeModel? selected,
    Set<ChallengeModel>? all,
  }) =>
      ChallengesState(
          all: all ?? this.all, selected: selected ?? this.selected);

  @override
  JsonMap toJson() => {
        'selected': selected?.toJson(),
        'all': [...all.map((e) => e.toJson())],
      };
}
