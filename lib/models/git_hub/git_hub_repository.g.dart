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
  Iterable<Object?> serialize(Serializers serializers, GitHubRepository object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GitHubRepository deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GitHubRepositoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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
              specifiedType: const FullType(GitHubUser))! as GitHubUser);
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
  final String? description;
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
          [void Function(GitHubRepositoryBuilder)? updates]) =>
      (new GitHubRepositoryBuilder()..update(updates)).build();

  _$GitHubRepository._(
      {required this.name,
      this.description,
      required this.isFork,
      required this.isPrivate,
      required this.stargazers,
      required this.url,
      required this.issues,
      required this.owner})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'GitHubRepository', 'name');
    BuiltValueNullFieldError.checkNotNull(isFork, 'GitHubRepository', 'isFork');
    BuiltValueNullFieldError.checkNotNull(
        isPrivate, 'GitHubRepository', 'isPrivate');
    BuiltValueNullFieldError.checkNotNull(
        stargazers, 'GitHubRepository', 'stargazers');
    BuiltValueNullFieldError.checkNotNull(url, 'GitHubRepository', 'url');
    BuiltValueNullFieldError.checkNotNull(issues, 'GitHubRepository', 'issues');
    BuiltValueNullFieldError.checkNotNull(owner, 'GitHubRepository', 'owner');
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
  _$GitHubRepository? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isFork;
  bool? get isFork => _$this._isFork;
  set isFork(bool? isFork) => _$this._isFork = isFork;

  bool? _isPrivate;
  bool? get isPrivate => _$this._isPrivate;
  set isPrivate(bool? isPrivate) => _$this._isPrivate = isPrivate;

  int? _stargazers;
  int? get stargazers => _$this._stargazers;
  set stargazers(int? stargazers) => _$this._stargazers = stargazers;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  int? _issues;
  int? get issues => _$this._issues;
  set issues(int? issues) => _$this._issues = issues;

  GitHubUserBuilder? _owner;
  GitHubUserBuilder get owner => _$this._owner ??= new GitHubUserBuilder();
  set owner(GitHubUserBuilder? owner) => _$this._owner = owner;

  GitHubRepositoryBuilder();

  GitHubRepositoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _isFork = $v.isFork;
      _isPrivate = $v.isPrivate;
      _stargazers = $v.stargazers;
      _url = $v.url;
      _issues = $v.issues;
      _owner = $v.owner.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GitHubRepository other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GitHubRepository;
  }

  @override
  void update(void Function(GitHubRepositoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GitHubRepository build() {
    _$GitHubRepository _$result;
    try {
      _$result = _$v ??
          new _$GitHubRepository._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'GitHubRepository', 'name'),
              description: description,
              isFork: BuiltValueNullFieldError.checkNotNull(
                  isFork, 'GitHubRepository', 'isFork'),
              isPrivate: BuiltValueNullFieldError.checkNotNull(
                  isPrivate, 'GitHubRepository', 'isPrivate'),
              stargazers: BuiltValueNullFieldError.checkNotNull(
                  stargazers, 'GitHubRepository', 'stargazers'),
              url: BuiltValueNullFieldError.checkNotNull(
                  url, 'GitHubRepository', 'url'),
              issues: BuiltValueNullFieldError.checkNotNull(
                  issues, 'GitHubRepository', 'issues'),
              owner: owner.build());
    } catch (_) {
      late String _$failedField;
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
