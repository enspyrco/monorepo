import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../ws_game_server_types.dart';

part 'other_player_ids_message.freezed.dart';
part 'other_player_ids_message.g.dart';

/// The set of ids that constitutes 'other players', ie. all present player ids
/// except for the player that the list is being sent to.
@freezed
class OtherPlayerIdsMessage with _$OtherPlayerIdsMessage, ServerMessage {
  static const String jsonType = 'other_player_ids';
  factory OtherPlayerIdsMessage(
      {@Default(OtherPlayerIdsMessage.jsonType) String type,
      required ISet<String> ids}) = _OtherPlayerIdsMessage;

  factory OtherPlayerIdsMessage.fromJson(JsonMap json) =>
      _$OtherPlayerIdsMessageFromJson(json);
}
