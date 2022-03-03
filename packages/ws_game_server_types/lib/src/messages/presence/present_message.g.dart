// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'present_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PresentMessage _$$_PresentMessageFromJson(Map<String, dynamic> json) =>
    _$_PresentMessage(
      json['userId'] as String,
      type: json['type'] as String? ?? PresentMessage.jsonType,
    );

Map<String, dynamic> _$$_PresentMessageToJson(_$_PresentMessage instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'type': instance.type,
    };
