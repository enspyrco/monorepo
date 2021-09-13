import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_game_server_types/src/utils/double2.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

import '../../types/typedefs.dart';

part 'player_path_message.freezed.dart';
part 'player_path_message.g.dart';

/// The path a player will move along
@freezed
class PlayerPathMessage with _$PlayerPathMessage, GameServerMessage {
  static const String jsonType = 'player_path';

  factory PlayerPathMessage(
      {@Default(PlayerPathMessage.jsonType) String type,
      required String userId,
      required IList<Double2> points}) = _PlayerPathMessage;

  factory PlayerPathMessage.fromJson(JsonMap json) =>
      _$PlayerPathMessageFromJson(json);
}
