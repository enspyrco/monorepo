// GENERATED CODE - DO NOT MODIFY BY HAND

part of retrieve_git_hub_repositories;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RetrieveGitHubRepositories> _$retrieveGitHubRepositoriesSerializer =
    new _$RetrieveGitHubRepositoriesSerializer();

class _$RetrieveGitHubRepositoriesSerializer
    implements StructuredSerializer<RetrieveGitHubRepositories> {
  @override
  final Iterable<Type> types = const [
    RetrieveGitHubRepositories,
    _$RetrieveGitHubRepositories
  ];
  @override
  final String wireName = 'RetrieveGitHubRepositories';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RetrieveGitHubRepositories object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  RetrieveGitHubRepositories deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new RetrieveGitHubRepositoriesBuilder().build();
  }
}

class _$RetrieveGitHubRepositories extends RetrieveGitHubRepositories {
  factory _$RetrieveGitHubRepositories(
          [void Function(RetrieveGitHubRepositoriesBuilder) updates]) =>
      (new RetrieveGitHubRepositoriesBuilder()..update(updates)).build();

  _$RetrieveGitHubRepositories._() : super._();

  @override
  RetrieveGitHubRepositories rebuild(
          void Function(RetrieveGitHubRepositoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RetrieveGitHubRepositoriesBuilder toBuilder() =>
      new RetrieveGitHubRepositoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RetrieveGitHubRepositories;
  }

  @override
  int get hashCode {
    return 264012426;
  }
}

class RetrieveGitHubRepositoriesBuilder
    implements
        Builder<RetrieveGitHubRepositories, RetrieveGitHubRepositoriesBuilder> {
  _$RetrieveGitHubRepositories _$v;

  RetrieveGitHubRepositoriesBuilder();

  @override
  void replace(RetrieveGitHubRepositories other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RetrieveGitHubRepositories;
  }

  @override
  void update(void Function(RetrieveGitHubRepositoriesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RetrieveGitHubRepositories build() {
    final _$result = _$v ?? new _$RetrieveGitHubRepositories._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
