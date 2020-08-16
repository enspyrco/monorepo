// GENERATED CODE - DO NOT MODIFY BY HAND

part of git_hub_repository;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GitHubRepository> _$gitHubRepositorySerializer =
    new _$GitHubRepositorySerializer();

class _$GitHubRepositorySerializer
    implements StructuredSerializer<GitHubRepository> {
  @override
  final Iterable<Type> types = const [GitHubRepository, _$GitHubRepository];
  @override
  final String wireName = 'GitHubRepository';

  @override
  Iterable<Object> serialize(Serializers serializers, GitHubRepository object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'isFork',
      serializers.serialize(object.isFork, specifiedType: const FullType(bool)),
      'isPrivate',
      serializers.serialize(object.isPrivate,
          specifiedType: const FullType(bool)),
      'stargazers',
      serializers.serialize(object.stargazers,
          specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'issues',
      serializers.serialize(object.issues, specifiedType: const FullType(int)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(GitHubUser)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GitHubRepository deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GitHubRepositoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isFork':
          result.isFork = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isPrivate':
          result.isPrivate = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'stargazers':
          result.stargazers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'issues':
          result.issues = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'owner':
          result.owner.replace(serializers.deserialize(value,
              specifiedType: const FullType(GitHubUser)) as GitHubUser);
          break;
      }
    }

    return result.build();
  }
}

class _$GitHubRepository extends GitHubRepository {
  @override
  final String name;
  @override
  final String description;
  @override
  final bool isFork;
  @override
  final bool isPrivate;
  @override
  final int stargazers;
  @override
  final String url;
  @override
  final int issues;
  @override
  final GitHubUser owner;

  factory _$GitHubRepository(
          [void Function(GitHubRepositoryBuilder) updates]) =>
      (new GitHubRepositoryBuilder()..update(updates)).build();

  _$GitHubRepository._(
      {this.name,
      this.description,
      this.isFork,
      this.isPrivate,
      this.stargazers,
      this.url,
      this.issues,
      this.owner})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GitHubRepository', 'name');
    }
    if (isFork == null) {
      throw new BuiltValueNullFieldError('GitHubRepository', 'isFork');
    }
    if (isPrivate == null) {
      throw new BuiltValueNullFieldError('GitHubRepository', 'isPrivate');
    }
    if (stargazers == null) {
      throw new BuiltValueNullFieldError('GitHubRepository', 'stargazers');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('GitHubRepository', 'url');
    }
    if (issues == null) {
      throw new BuiltValueNullFieldError('GitHubRepository', 'issues');
    }
    if (owner == null) {
      throw new BuiltValueNullFieldError('GitHubRepository', 'owner');
    }
  }

  @override
  GitHubRepository rebuild(void Function(GitHubRepositoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GitHubRepositoryBuilder toBuilder() =>
      new GitHubRepositoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GitHubRepository &&
        name == other.name &&
        description == other.description &&
        isFork == other.isFork &&
        isPrivate == other.isPrivate &&
        stargazers == other.stargazers &&
        url == other.url &&
        issues == other.issues &&
        owner == other.owner;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), description.hashCode),
                            isFork.hashCode),
                        isPrivate.hashCode),
                    stargazers.hashCode),
                url.hashCode),
            issues.hashCode),
        owner.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GitHubRepository')
          ..add('name', name)
          ..add('description', description)
          ..add('isFork', isFork)
          ..add('isPrivate', isPrivate)
          ..add('stargazers', stargazers)
          ..add('url', url)
          ..add('issues', issues)
          ..add('owner', owner))
        .toString();
  }
}

class GitHubRepositoryBuilder
    implements Builder<GitHubRepository, GitHubRepositoryBuilder> {
  _$GitHubRepository _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _isFork;
  bool get isFork => _$this._isFork;
  set isFork(bool isFork) => _$this._isFork = isFork;

  bool _isPrivate;
  bool get isPrivate => _$this._isPrivate;
  set isPrivate(bool isPrivate) => _$this._isPrivate = isPrivate;

  int _stargazers;
  int get stargazers => _$this._stargazers;
  set stargazers(int stargazers) => _$this._stargazers = stargazers;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _issues;
  int get issues => _$this._issues;
  set issues(int issues) => _$this._issues = issues;

  GitHubUserBuilder _owner;
  GitHubUserBuilder get owner => _$this._owner ??= new GitHubUserBuilder();
  set owner(GitHubUserBuilder owner) => _$this._owner = owner;

  GitHubRepositoryBuilder();

  GitHubRepositoryBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _isFork = _$v.isFork;
      _isPrivate = _$v.isPrivate;
      _stargazers = _$v.stargazers;
      _url = _$v.url;
      _issues = _$v.issues;
      _owner = _$v.owner?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GitHubRepository other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GitHubRepository;
  }

  @override
  void update(void Function(GitHubRepositoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GitHubRepository build() {
    _$GitHubRepository _$result;
    try {
      _$result = _$v ??
          new _$GitHubRepository._(
              name: name,
              description: description,
              isFork: isFork,
              isPrivate: isPrivate,
              stargazers: stargazers,
              url: url,
              issues: issues,
              owner: owner.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'owner';
        owner.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GitHubRepository', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
