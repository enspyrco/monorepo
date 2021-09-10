import 'package:freezed_annotation/freezed_annotation.dart';

part 'announce_presence.freezed.dart';
part 'announce_presence.g.dart';

@freezed
class AnnouncePresence with _$AnnouncePresence {
  factory AnnouncePresence(String userId,
      {@Default('announce_presence') String type}) = _AnnouncePresence;

  factory AnnouncePresence.fromJson(Map<String, Object?> json) =>
      _$AnnouncePresenceFromJson(json);
}
