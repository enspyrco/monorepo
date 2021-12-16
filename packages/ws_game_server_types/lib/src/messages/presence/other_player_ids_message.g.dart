// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_player_ids_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtherPlayerIdsMessage _$$_OtherPlayerIdsMessageFromJson(
        Map<String, dynamic> json) =>
    _$_OtherPlayerIdsMessage(
      type: json['type'] as String? ?? OtherPlayerIdsMessage.jsonType,
      ids: ISet<String>.fromJson(json['ids'], (value) => value as String),
    );

Map<String, dynamic> _$$_OtherPlayerIdsMessageToJson(
        _$_OtherPlayerIdsMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'ids': instance.ids.toJson(
        (value) => value,
      ),
    };
