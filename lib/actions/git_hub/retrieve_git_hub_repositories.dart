library retrieve_git_hub_repositories;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'retrieve_git_hub_repositories.g.dart';

abstract class RetrieveGitHubRepositories extends Object
    with ReduxAction
    implements
        Built<RetrieveGitHubRepositories, RetrieveGitHubRepositoriesBuilder> {
  RetrieveGitHubRepositories._();

  factory RetrieveGitHubRepositories() = _$RetrieveGitHubRepositories._;

  Object toJson() =>
      serializers.serializeWith(RetrieveGitHubRepositories.serializer, this);

  static RetrieveGitHubRepositories fromJson(String jsonString) =>
      serializers.deserializeWith(
          RetrieveGitHubRepositories.serializer, json.decode(jsonString));

  static Serializer<RetrieveGitHubRepositories> get serializer =>
      _$retrieveGitHubRepositoriesSerializer;

  @override
  String toString() => 'RETRIEVE_GIT_HUB_REPOSITORIES';
}
