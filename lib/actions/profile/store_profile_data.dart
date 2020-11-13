library store_profile_data;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/profile/profile_data.dart';
import 'package:the_process/serializers.dart';

part 'store_profile_data.g.dart';

abstract class StoreProfileData extends Object
    with ReduxAction
    implements Built<StoreProfileData, StoreProfileDataBuilder> {
  ProfileData get data;

  StoreProfileData._();

  factory StoreProfileData({@required ProfileData data}) = _$StoreProfileData._;

  factory StoreProfileData.by(
      [void Function(StoreProfileDataBuilder) updates]) = _$StoreProfileData;

  Object toJson() =>
      serializers.serializeWith(StoreProfileData.serializer, this);

  static StoreProfileData fromJson(String jsonString) => serializers
      .deserializeWith(StoreProfileData.serializer, json.decode(jsonString));

  static Serializer<StoreProfileData> get serializer =>
      _$storeProfileDataSerializer;

  @override
  String toString() => 'STORE_PROFILE_DATA';
}
