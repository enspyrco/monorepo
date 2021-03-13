library remove_problem;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'remove_problem.g.dart';

abstract class RemoveProblem extends Object
    with ReduxAction
    implements Built<RemoveProblem, RemoveProblemBuilder> {
  RemoveProblem._();

  factory RemoveProblem() = _$RemoveProblem._;

  Object? toJson() => serializers.serializeWith(RemoveProblem.serializer, this);

  static RemoveProblem? fromJson(String jsonString) => serializers
      .deserializeWith(RemoveProblem.serializer, json.decode(jsonString));

  static Serializer<RemoveProblem> get serializer => _$removeProblemSerializer;

  @override
  String toString() => 'REMOVE_PROBLEM';
}
