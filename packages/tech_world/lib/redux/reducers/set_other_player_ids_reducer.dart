import 'package:redux/redux.dart';

import '../actions/set_other_player_ids_action.dart';
import '../app_state.dart';

class SetOtherPlayerIdsReducer
    extends TypedReducer<AppState, SetOtherPlayerIdsAction> {
  SetOtherPlayerIdsReducer()
      : super(
          (state, action) => state.copyWith.game(
              otherPlayerIds: state.game.otherPlayerIds.addAll(action.ids)),
        );
}
