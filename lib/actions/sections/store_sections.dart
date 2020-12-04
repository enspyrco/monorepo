library store_sections;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'store_sections.g.dart';

abstract class StoreSections extends Object
    with ReduxAction
    implements Built<StoreSections, StoreSectionsBuilder> {
  BuiltList get list;

  StoreSections._();

  factory StoreSections({@required BuiltList list}) = _$StoreSections._;

  factory StoreSections.by([void Function(StoreSectionsBuilder) updates]) =
      _$StoreSections;

  Object toJson() => serializers.serializeWith(StoreSections.serializer, this);

  static StoreSections fromJson(String jsonString) => serializers
      .deserializeWith(StoreSections.serializer, json.decode(jsonString));

  static Serializer<StoreSections> get serializer => _$storeSectionsSerializer;

  @override
  String toString() => 'STORE_SECTIONS';
}
