library plumb_services;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'plumb_streams_action.g.dart';

abstract class PlumbStreamsAction extends Object
    with ReduxAction
    implements Built<PlumbStreamsAction, PlumbStreamsActionBuilder> {
  PlumbStreamsAction._();

  factory PlumbStreamsAction() = _$PlumbStreamsAction._;

  Object? toJson() =>
      serializers.serializeWith(PlumbStreamsAction.serializer, this);

  static PlumbStreamsAction? fromJson(String jsonString) => serializers
      .deserializeWith(PlumbStreamsAction.serializer, json.decode(jsonString));

  static Serializer<PlumbStreamsAction> get serializer =>
      _$plumbStreamsActionSerializer;

  @override
  String toString() => 'PLUMB_SERVICES';
}
