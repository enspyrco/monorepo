library store_flireator;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/flireator/flireator.dart';
import 'package:flireator/utils/serializers.dart';
import 'package:meta/meta.dart';

part 'store_flireator.g.dart';

abstract class StoreFlireator extends Object
    with ReduxAction
    implements Built<StoreFlireator, StoreFlireatorBuilder> {
  Flireator get flireator;

  StoreFlireator._();

  factory StoreFlireator({@required Flireator flireator}) = _$StoreFlireator._;

  Object toJson() => serializers.serializeWith(StoreFlireator.serializer, this);

  static StoreFlireator fromJson(String jsonString) => serializers
      .deserializeWith(StoreFlireator.serializer, json.decode(jsonString));

  static Serializer<StoreFlireator> get serializer =>
      _$storeFlireatorSerializer;

  @override
  String toString() => 'STORE_FLIREATOR';
}
