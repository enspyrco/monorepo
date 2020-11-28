library store_new_section_name;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'store_new_section_name.g.dart';

abstract class StoreNewSectionName extends Object
    with ReduxAction
    implements Built<StoreNewSectionName, StoreNewSectionNameBuilder> {
  String get value;

  StoreNewSectionName._();

  factory StoreNewSectionName({@required String value}) =
      _$StoreNewSectionName._;

  factory StoreNewSectionName.by(
          [void Function(StoreNewSectionNameBuilder) updates]) =
      _$StoreNewSectionName;

  Object toJson() =>
      serializers.serializeWith(StoreNewSectionName.serializer, this);

  static StoreNewSectionName fromJson(String jsonString) => serializers
      .deserializeWith(StoreNewSectionName.serializer, json.decode(jsonString));

  static Serializer<StoreNewSectionName> get serializer =>
      _$storeNewSectionNameSerializer;

  @override
  String toString() => 'STORE_NEW_SECTION_NAME';
}
