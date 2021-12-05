import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/challenges/models/challenges_state.dart';
import 'package:adventure_maker/shared/actions/select_adventure_node_action.dart';
import 'package:redux/redux.dart';

class SelectAdventureNodeReducer
    extends TypedReducer<AppState, SelectAdventureNodeAction> {
  SelectAdventureNodeReducer()
      : super((state, action) {
          var model = action.selection;
          if (model.isAdventure()) {
            return state.copyWith(
                adventures: state.adventures
                    .copyWith(selected: (action.selection as AdventureModel)),
                challenges: ChallengesState.init());
          }
          if (model.isChallenge()) {
            return state.copyWith
                .challenges(selected: action.selection as ChallengeModel);
          }
          return state;
        });
}
