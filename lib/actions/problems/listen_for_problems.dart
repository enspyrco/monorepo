library listen_for_problems;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'listen_for_problems.g.dart';

abstract class ListenForProblems extends Object
    with ReduxAction
    implements Built<ListenForProblems, ListenForProblemsBuilder> {
  ListenForProblems._();

  factory ListenForProblems() = _$ListenForProblems._;

  Object? toJson() =>
      serializers.serializeWith(ListenForProblems.serializer, this);

  static ListenForProblems? fromJson(String jsonString) => serializers
      .deserializeWith(ListenForProblems.serializer, json.decode(jsonString));

  static Serializer<ListenForProblems> get serializer =>
      _$listenForProblemsSerializer;

  @override
  String toString() => 'LISTEN_FOR_PROBLEMS';
}
