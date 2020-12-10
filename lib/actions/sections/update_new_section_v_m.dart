library update_new_section_v_m;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'update_new_section_v_m.g.dart';

abstract class UpdateNewSectionVM extends Object
    with ReduxAction
    implements Built<UpdateNewSectionVM, UpdateNewSectionVMBuilder> {
  @nullable
  String get name;

  UpdateNewSectionVM._();

  factory UpdateNewSectionVM({String name}) = _$UpdateNewSectionVM._;

  factory UpdateNewSectionVM.by(
          [void Function(UpdateNewSectionVMBuilder) updates]) =
      _$UpdateNewSectionVM;

  Object toJson() =>
      serializers.serializeWith(UpdateNewSectionVM.serializer, this);

  static UpdateNewSectionVM fromJson(String jsonString) => serializers
      .deserializeWith(UpdateNewSectionVM.serializer, json.decode(jsonString));

  static Serializer<UpdateNewSectionVM> get serializer =>
      _$updateNewSectionVMSerializer;

  @override
  String toString() => 'UPDATE_NEW_SECTION_V_M';
}
