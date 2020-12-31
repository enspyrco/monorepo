library disregard_profile_data;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'disregard_profile_data.g.dart';

abstract class DisregardProfileData extends Object
    with ReduxAction
    implements Built<DisregardProfileData, DisregardProfileDataBuilder> {
  DisregardProfileData._();

  factory DisregardProfileData() = _$DisregardProfileData._;

  Object toJson() =>
      serializers.serializeWith(DisregardProfileData.serializer, this);

  // static DisregardProfileData fromJson(String jsonString) =>
  //     serializers.deserializeWith(
  //         DisregardProfileData.serializer, json.decode(jsonString));

  static Serializer<DisregardProfileData> get serializer =>
      _$disregardProfileDataSerializer;

  @override
  String toString() => 'DISREGARD_PROFILE_DATA';
}
