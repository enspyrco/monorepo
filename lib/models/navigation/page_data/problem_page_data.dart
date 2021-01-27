library problem_page_data;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/serializers.dart';

part 'problem_page_data.g.dart';

abstract class ProblemPageData
    implements PageData, Built<ProblemPageData, ProblemPageDataBuilder> {
  Problem get problem;

  ProblemPageData._();

  factory ProblemPageData({required Problem problem}) = _$ProblemPageData._;

  Object toJson() =>
      serializers.serializeWith(ProblemPageData.serializer, this);

  static Serializer<ProblemPageData> get serializer =>
      _$problemPageDataSerializer;
}
