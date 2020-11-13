library initial_page_data;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/serializers.dart';

part 'initial_page_data.g.dart';

abstract class InitialPageData
    implements PageData, Built<InitialPageData, InitialPageDataBuilder> {
  InitialPageData._();

  factory InitialPageData() = _$InitialPageData._;

  Object toJson() =>
      serializers.serializeWith(InitialPageData.serializer, this);

  static InitialPageData fromJson(String jsonString) => serializers
      .deserializeWith(InitialPageData.serializer, json.decode(jsonString));

  static Serializer<InitialPageData> get serializer =>
      _$initialPageDataSerializer;
}
