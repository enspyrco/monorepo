library app_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/enums/navigation/nav_selection.dart';
import 'package:flireator/models/app/settings.dart';
import 'package:flireator/models/auth/auth_data.dart';
import 'package:flireator/models/flireator/flireator.dart';
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

  /// Navigation
  NavSelection get navSelection;

  /// Auth
  SignInStep get signInStep;
  @nullable
  AuthData get authData;

  /// Flireator
  @nullable
  Flireator get flireator;

  /// GitHub
  @nullable
  String get gitHubToken;

  AppState._();

  factory AppState.init() => AppState((a) => a
    ..navSelection = NavSelection.local
    ..settings = Settings.initBuilder()
    ..signInStep = SignInStep.checking);

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  static AppState fromJson(String jsonString) =>
      serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
