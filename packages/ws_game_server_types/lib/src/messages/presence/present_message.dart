import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../ws_game_server_types.dart';

part 'present_message.freezed.dart';
part 'present_message.g.dart';

/// A message each user sends on app load to register their presence with the
/// server.
@freezed
class PresentMessage with _$PresentMessage, ServerMessage {
  static const String jsonType = 'present';
  factory PresentMessage(String userId,
      {@Default(PresentMessage.jsonType) String type}) = _PresentMessage;

  factory PresentMessage.fromJson(JsonMap json) =>
      _$PresentMessageFromJson(json);
}
