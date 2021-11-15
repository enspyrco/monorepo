import 'package:redux/redux.dart';
import 'package:tech_world/challenges/actions/start_challenge_action.dart';
import 'package:tech_world/challenges/enums/challenge_enum.dart';
import 'package:tech_world/challenges/models/challenge_model.dart';
import 'package:tech_world/challenges/models/fix_repo_challenge_model.dart';
import 'package:tech_world/redux/app_state.dart';

class StartChallengeReducer
    extends TypedReducer<AppState, StartChallengeAction> {
  StartChallengeReducer()
      : super((state, action) {
          ChallengeModel? challenge;
          if (action.challengeType == ChallengeEnum.fixRepo) {
            challenge = const FixRepoChallengeModel(
              repoUrl: 'https://github.com/adventures-in/devtools_adventure',
              tasks: [],
            );
          }
          return state.copyWith(challenge: challenge);
        });
}
