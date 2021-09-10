// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announce_presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnouncePresence _$$_AnnouncePresenceFromJson(Map<String, dynamic> json) =>
    _$_AnnouncePresence(
      json['userId'] as String,
      type: json['type'] as String? ?? 'announce_presence',
    );

Map<String, dynamic> _$$_AnnouncePresenceToJson(_$_AnnouncePresence instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'type': instance.type,
    };
