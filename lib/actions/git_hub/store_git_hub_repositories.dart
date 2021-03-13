library store_git_hub_repositories;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/git_hub/git_hub_repository.dart';
import 'package:flireator/utils/serializers.dart';

part 'store_git_hub_repositories.g.dart';

abstract class StoreGitHubRepositories extends Object
    with ReduxAction
    implements Built<StoreGitHubRepositories, StoreGitHubRepositoriesBuilder> {
  BuiltList<GitHubRepository> get repositories;

  StoreGitHubRepositories._();

  factory StoreGitHubRepositories(
          {required BuiltList<GitHubRepository> repositories}) =
      _$StoreGitHubRepositories._;

  Object? toJson() =>
      serializers.serializeWith(StoreGitHubRepositories.serializer, this);

  static StoreGitHubRepositories? fromJson(String jsonString) =>
      serializers.deserializeWith(
          StoreGitHubRepositories.serializer, json.decode(jsonString));

  static Serializer<StoreGitHubRepositories> get serializer =>
      _$storeGitHubRepositoriesSerializer;

  @override
  String toString() => 'STORE_GIT_HUB_REPOSITORIES';
}
