library store_git_hub_token;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'store_git_hub_token.g.dart';

abstract class StoreGitHubToken extends Object
    with ReduxAction
    implements Built<StoreGitHubToken, StoreGitHubTokenBuilder> {
  String? get token;

  StoreGitHubToken._();

  factory StoreGitHubToken({required String token}) = _$StoreGitHubToken._;

  Object? toJson() =>
      serializers.serializeWith(StoreGitHubToken.serializer, this);

  static StoreGitHubToken? fromJson(String jsonString) => serializers
      .deserializeWith(StoreGitHubToken.serializer, json.decode(jsonString));

  static Serializer<StoreGitHubToken> get serializer =>
      _$storeGitHubTokenSerializer;

  @override
  String toString() {
    final localToken = token;
    final tokenOutput =
        (localToken == null) ? 'null' : localToken.substring(0, 4) + '...';
    return 'STORE_GIT_HUB_TOKEN: $tokenOutput';
  }
}
