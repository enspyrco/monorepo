// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'present_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PresentSet _$$_PresentSetFromJson(Map<String, dynamic> json) =>
    _$_PresentSet(
      type: json['type'] as String? ?? 'present_set',
      ids: ISet.fromJson(json['ids'], (value) => value as String),
    );

Map<String, dynamic> _$$_PresentSetToJson(_$_PresentSet instance) =>
    <String, dynamic>{
      'type': instance.type,
      'ids': instance.ids.toJson(
        (value) => value,
      ),
    };
