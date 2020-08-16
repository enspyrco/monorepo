library plumb_services;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'plumb_services.g.dart';

abstract class PlumbServices extends Object
    with ReduxAction
    implements Built<PlumbServices, PlumbServicesBuilder> {
  PlumbServices._();

  factory PlumbServices() = _$PlumbServices._;

  Object toJson() => serializers.serializeWith(PlumbServices.serializer, this);

  static PlumbServices fromJson(String jsonString) => serializers
      .deserializeWith(PlumbServices.serializer, json.decode(jsonString));

  static Serializer<PlumbServices> get serializer => _$plumbServicesSerializer;

  @override
  String toString() => 'PLUMB_SERVICES';
}
