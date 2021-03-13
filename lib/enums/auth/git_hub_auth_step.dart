import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/utils/serializers.dart';

part 'git_hub_auth_step.g.dart';

class GitHubAuthStep extends EnumClass {
  static Serializer<GitHubAuthStep> get serializer =>
      _$gitHubAuthStepSerializer;
  static const GitHubAuthStep retrievingStoredToken = _$retrievingStoredToken;
  static const GitHubAuthStep requestingGitHubAuth = _$requestingGitHubAuth;
  static const GitHubAuthStep exchangingCode = _$exchangingCode;
  static const GitHubAuthStep exchangedCode = _$exchangedCode;
  static const GitHubAuthStep signingInWithGitHub = _$signingInWithGitHub;

  static const Map<GitHubAuthStep, int> _$indexMap = {
    retrievingStoredToken: 0,
    requestingGitHubAuth: 1,
    exchangingCode: 2,
    exchangedCode: 3,
    signingInWithGitHub: 4,
  };

  const GitHubAuthStep._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<GitHubAuthStep> get values => _$values;
  static GitHubAuthStep valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(GitHubAuthStep.serializer, this);
}
