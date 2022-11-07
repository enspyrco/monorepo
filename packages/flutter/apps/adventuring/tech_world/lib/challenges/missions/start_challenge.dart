import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../enums/challenge_enum.dart';
import '../models/challenge_model.dart';
import '../models/fix_repo_challenge_model.dart';

class StartChallenge extends LandingMission<AppState> {
  const StartChallenge({required this.challengeType});

  final ChallengeEnum challengeType;

  @override
  AppState landingInstructions(AppState state) {
    ChallengeModel? challenge;
    if (challengeType == ChallengeEnum.fixRepo) {
      challenge = const FixRepoChallengeModel(
        repoUrl: 'https://github.com/adventures-in/devtools_adventure',
        tasks: [],
      );
    }
    return state.copyWith(challenge: challenge);
  }

  @override
  toJson() => {
        'name_': 'StartChallenge',
        'state_': {'challenge-type': challengeType.toString()}
      };
}
