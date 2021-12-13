import 'package:redux/redux.dart';

import '../../redux/app_state.dart';
import '../actions/dismiss_challenge_action.dart';

class DismissChallengeReducer
    extends TypedReducer<AppState, DismissChallengeAction> {
  DismissChallengeReducer()
      : super(
          (state, action) => state.copyWith(challenge: null),
        );
}
