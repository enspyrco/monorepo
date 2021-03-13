library request_git_hub_auth;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'request_git_hub_auth.g.dart';

abstract class RequestGitHubAuth extends Object
    with ReduxAction
    implements Built<RequestGitHubAuth, RequestGitHubAuthBuilder> {
  RequestGitHubAuth._();

  factory RequestGitHubAuth() = _$RequestGitHubAuth._;

  Object? toJson() =>
      serializers.serializeWith(RequestGitHubAuth.serializer, this);

  static RequestGitHubAuth? fromJson(String jsonString) => serializers
      .deserializeWith(RequestGitHubAuth.serializer, json.decode(jsonString));

  static Serializer<RequestGitHubAuth> get serializer =>
      _$requestGitHubAuthSerializer;

  @override
  String toString() => 'REQUEST_GIT_HUB_AUTH';
}
