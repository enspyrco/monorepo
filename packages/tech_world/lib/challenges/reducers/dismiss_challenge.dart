import 'package:redux/redux.dart';
import 'package:tech_world/challenges/actions/dismiss_challenge_action.dart';
import 'package:tech_world/redux/app_state.dart';

class DismissChallengeReducer
    extends TypedReducer<AppState, DismissChallengeAction> {
  DismissChallengeReducer()
      : super(
          (state, action) => state.copyWith(challenge: null),
        );
}
