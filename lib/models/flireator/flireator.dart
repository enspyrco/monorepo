library flireator;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/utils/serializers.dart';
import 'package:meta/meta.dart';

part 'flireator.g.dart';

abstract class Flireator implements Built<Flireator, FlireatorBuilder> {
  String get id;
  @nullable
  String get displayName;
  @nullable
  String get photoURL;

  Flireator._();

  factory Flireator(
      {@required String id,
      @required String displayName,
      @required String photoURL}) = _$Flireator._;

  factory Flireator.by([void Function(FlireatorBuilder) updates]) = _$Flireator;

  Object toJson() => serializers.serializeWith(Flireator.serializer, this);

  static Flireator fromJson(String jsonString) => serializers.deserializeWith(
      Flireator.serializer, json.decode(jsonString));

  static Serializer<Flireator> get serializer => _$flireatorSerializer;
}
