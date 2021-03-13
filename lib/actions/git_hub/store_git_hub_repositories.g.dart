// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_git_hub_repositories;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreGitHubRepositories> _$storeGitHubRepositoriesSerializer =
    new _$StoreGitHubRepositoriesSerializer();

class _$StoreGitHubRepositoriesSerializer
    implements StructuredSerializer<StoreGitHubRepositories> {
  @override
  final Iterable<Type> types = const [
    StoreGitHubRepositories,
    _$StoreGitHubRepositories
  ];
  @override
  final String wireName = 'StoreGitHubRepositories';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, StoreGitHubRepositories object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'repositories',
      serializers.serialize(object.repositories,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GitHubRepository)])),
    ];

    return result;
  }

  @override
  StoreGitHubRepositories deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreGitHubRepositoriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'repositories':
          result.repositories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GitHubRepository)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$StoreGitHubRepositories extends StoreGitHubRepositories {
  @override
  final BuiltList<GitHubRepository> repositories;

  factory _$StoreGitHubRepositories(
          [void Function(StoreGitHubRepositoriesBuilder)? updates]) =>
      (new StoreGitHubRepositoriesBuilder()..update(updates)).build();

  _$StoreGitHubRepositories._({required this.repositories}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        repositories, 'StoreGitHubRepositories', 'repositories');
  }

  @override
  StoreGitHubRepositories rebuild(
          void Function(StoreGitHubRepositoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreGitHubRepositoriesBuilder toBuilder() =>
      new StoreGitHubRepositoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreGitHubRepositories &&
        repositories == other.repositories;
  }

  @override
  int get hashCode {
    return $jf($jc(0, repositories.hashCode));
  }
}

class StoreGitHubRepositoriesBuilder
    implements
        Builder<StoreGitHubRepositories, StoreGitHubRepositoriesBuilder> {
  _$StoreGitHubRepositories? _$v;

  ListBuilder<GitHubRepository>? _repositories;
  ListBuilder<GitHubRepository> get repositories =>
      _$this._repositories ??= new ListBuilder<GitHubRepository>();
  set repositories(ListBuilder<GitHubRepository>? repositories) =>
      _$this._repositories = repositories;

  StoreGitHubRepositoriesBuilder();

  StoreGitHubRepositoriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _repositories = $v.repositories.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreGitHubRepositories other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoreGitHubRepositories;
  }

  @override
  void update(void Function(StoreGitHubRepositoriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreGitHubRepositories build() {
    _$StoreGitHubRepositories _$result;
    try {
      _$result = _$v ??
          new _$StoreGitHubRepositories._(repositories: repositories.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'repositories';
        repositories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StoreGitHubRepositories', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
