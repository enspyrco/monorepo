import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/start_challenge_action.dart';
import '../enums/challenge_enum.dart';
import '../models/challenge_model.dart';
import '../models/fix_repo_challenge_model.dart';

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
