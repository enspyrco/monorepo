import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/actions/set_adventure_nodes_action.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redux/redux.dart';

class SetAdventureNodesReducer
    extends TypedReducer<AppState, SetAdventureNodesAction> {
  SetAdventureNodesReducer()
      : super((state, action) {
          if (state.adventures.selected == null) {
            return state.copyWith
                .adventures(all: action.list as ISet<AdventureModel>);
          } else if (state.challenges.selected == null) {
            return state.copyWith
                .challenges(all: action.list as ISet<ChallengeModel>);
          } else {
            return state;
          }
        });
}
