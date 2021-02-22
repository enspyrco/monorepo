library add_problem;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/serializers.dart';

part 'add_problem.g.dart';

abstract class AddProblem extends Object
    with ReduxAction
    implements Built<AddProblem, AddProblemBuilder> {
  String get errorString; // built_value won't allow dynamic
  String? get traceString;
  BuiltMap<String, Object>? get info;

  AddProblem._();

  factory AddProblem(
      {required String errorString,
      required String? traceString,
      BuiltMap<String, Object> info}) = _$AddProblem._;

  factory AddProblem.by([void Function(AddProblemBuilder) updates]) =
      _$AddProblem;

  Problem get problem =>
      Problem(errorString: errorString, traceString: traceString, info: info);

  Object toJson() => serializers.serializeWith(AddProblem.serializer, this);

  // static AddProblem fromJson(String jsonString) => serializers.deserializeWith(
  //     AddProblem.serializer, json.decode(jsonString));

  static Serializer<AddProblem> get serializer => _$addProblemSerializer;

  @override
  String toString() => 'ADD_PROBLEM';
}
