import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/types.dart';

extension JsonListExtension on JsonList {
  ISet<AdventureModel> toAdventures() =>
      map<AdventureModel>((json) => AdventureModel.fromJson(json as JsonMap))
          .toISet();

  ISet<ChallengeModel> toChallenges() =>
      map<ChallengeModel>((json) => ChallengeModel.fromJson(json as JsonMap))
          .toISet();
}
