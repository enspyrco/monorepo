// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_path_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerPathMessage _$$_PlayerPathMessageFromJson(Map<String, dynamic> json) =>
    _$_PlayerPathMessage(
      type: json['type'] as String? ?? PlayerPathMessage.jsonType,
      userId: json['userId'] as String,
      points: IList<Double2>.fromJson(json['points'],
          (value) => Double2.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_PlayerPathMessageToJson(
        _$_PlayerPathMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'userId': instance.userId,
      'points': instance.points.toJson(
        (value) => value,
      ),
    };
