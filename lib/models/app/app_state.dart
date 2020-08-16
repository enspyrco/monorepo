library app_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/enums/auth/auth_step.dart';
import 'package:flireator/models/app/settings.dart';
import 'package:flireator/models/auth/user_data.dart';
import 'package:flireator/models/problems/problem.dart';
import 'package:flireator/utils/serializers.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  /// Problems
  BuiltList<Problem> get problems;
  @nullable
  Problem get displayProblem;

  /// Settings
  Settings get settings;

  /// Auth
  AuthStep get authStep;
  @nullable
  UserData get userData;

  /// GitHub
  @nullable
  String get gitHubToken;

  AppState._();

  factory AppState.init() => AppState((a) => a
    ..settings = Settings.initBuilder()
    ..authStep = AuthStep.checking);

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  static AppState fromJson(String jsonString) =>
      serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
