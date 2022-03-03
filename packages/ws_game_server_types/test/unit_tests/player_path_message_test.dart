import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:test/test.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

void main() {
  group('PlayerPathMessage', () {
    test('serializes to json then back to an equivalent object', () {
      // TODO: use (eg.) Double2(1, 2), Double2(2, 1) for points parameter - test breaks
      var message = PlayerPathMessage(userId: 'userId', points: IList([]));

      var json = message.toJson();

      var newMessage = PlayerPathMessage.fromJson(json);

      expect(newMessage, equals(message));
    });
  });
}
