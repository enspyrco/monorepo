library sections_v_m;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:the_process/models/sections/new_section_v_m.dart';
import 'package:the_process/models/sections/section.dart';
import 'package:the_process/serializers.dart';

part 'sections_v_m.g.dart';

abstract class SectionsVM implements Built<SectionsVM, SectionsVMBuilder> {
  NewSectionVM get newSection;
  BuiltList<Section> get list;
  bool get creatingNewSection;

  SectionsVM._();

  static SectionsVMBuilder get initialBuilder => SectionsVMBuilder()
    ..newSection = NewSectionVM.initialBuilder
    ..creatingNewSection = false;

  factory SectionsVM(
      {@required NewSectionVM newSection,
      @required bool creatingNewSection}) = _$SectionsVM._;

  factory SectionsVM.by([void Function(SectionsVMBuilder) updates]) =
      _$SectionsVM;

  Object toJson() => serializers.serializeWith(SectionsVM.serializer, this);

  static SectionsVM fromJson(String jsonString) => serializers.deserializeWith(
      SectionsVM.serializer, json.decode(jsonString));

  static Serializer<SectionsVM> get serializer => _$sectionsVMSerializer;
}
