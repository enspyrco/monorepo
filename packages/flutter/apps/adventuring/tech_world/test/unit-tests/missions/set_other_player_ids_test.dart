import 'package:tech_world/app/state/app_state.dart';
import 'package:tech_world/networking/missions/set_other_player_ids.dart';
import 'package:test/test.dart';

void main() {
  group('SetOtherPlayerIdsReducer', () {
    test('should update otherPlayerIds', () {
      const testIds = {'1', '2'};

      final initialState = AppState.initial;
      expect(initialState.auth.user.uid, null);

      const mission = SetOtherPlayerIds(testIds);
      var newState = mission.landingInstructions(initialState);

      expect(newState.game.otherPlayerIds, testIds);
    });
  });
}
