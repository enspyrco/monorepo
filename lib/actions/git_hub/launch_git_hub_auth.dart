library launch_git_hub_auth;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'launch_git_hub_auth.g.dart';

abstract class LaunchGitHubAuth extends Object
    with ReduxAction
    implements Built<LaunchGitHubAuth, LaunchGitHubAuthBuilder> {
  LaunchGitHubAuth._();

  factory LaunchGitHubAuth() = _$LaunchGitHubAuth._;

  Object toJson() =>
      serializers.serializeWith(LaunchGitHubAuth.serializer, this);

  static LaunchGitHubAuth fromJson(String jsonString) => serializers
      .deserializeWith(LaunchGitHubAuth.serializer, json.decode(jsonString));

  static Serializer<LaunchGitHubAuth> get serializer =>
      _$launchGitHubAuthSerializer;

  @override
  String toString() => 'LAUNCH_GIT_HUB_AUTH';
}
