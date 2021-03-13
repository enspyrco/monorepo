library retrieve_flireator_data;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'retrieve_flireator_data.g.dart';

abstract class RetrieveFlireatorData extends Object
    with ReduxAction
    implements Built<RetrieveFlireatorData, RetrieveFlireatorDataBuilder> {
  String get userId;
  RetrieveFlireatorData._();

  factory RetrieveFlireatorData({required String userId}) =
      _$RetrieveFlireatorData._;

  Object? toJson() =>
      serializers.serializeWith(RetrieveFlireatorData.serializer, this);

  static RetrieveFlireatorData? fromJson(String jsonString) =>
      serializers.deserializeWith(
          RetrieveFlireatorData.serializer, json.decode(jsonString));

  static Serializer<RetrieveFlireatorData> get serializer =>
      _$retrieveFlireatorDataSerializer;

  @override
  String toString() => 'RETRIEVE_FLIREATOR_DATA';
}
