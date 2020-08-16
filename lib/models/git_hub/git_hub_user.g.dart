// GENERATED CODE - DO NOT MODIFY BY HAND

part of git_hub_user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GitHubUser> _$gitHubUserSerializer = new _$GitHubUserSerializer();

class _$GitHubUserSerializer implements StructuredSerializer<GitHubUser> {
  @override
  final Iterable<Type> types = const [GitHubUser, _$GitHubUser];
  @override
  final String wireName = 'GitHubUser';

  @override
  Iterable<Object> serialize(Serializers serializers, GitHubUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'avatarUrl',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GitHubUser deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GitHubUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarUrl':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GitHubUser extends GitHubUser {
  @override
  final String login;
  @override
  final String avatarUrl;

  factory _$GitHubUser([void Function(GitHubUserBuilder) updates]) =>
      (new GitHubUserBuilder()..update(updates)).build();

  _$GitHubUser._({this.login, this.avatarUrl}) : super._() {
    if (login == null) {
      throw new BuiltValueNullFieldError('GitHubUser', 'login');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('GitHubUser', 'avatarUrl');
    }
  }

  @override
  GitHubUser rebuild(void Function(GitHubUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GitHubUserBuilder toBuilder() => new GitHubUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GitHubUser &&
        login == other.login &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, login.hashCode), avatarUrl.hashCode));
  }
}

class GitHubUserBuilder implements Builder<GitHubUser, GitHubUserBuilder> {
  _$GitHubUser _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _avatarUrl;
  String get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String avatarUrl) => _$this._avatarUrl = avatarUrl;

  GitHubUserBuilder();

  GitHubUserBuilder get _$this {
    if (_$v != null) {
      _login = _$v.login;
      _avatarUrl = _$v.avatarUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GitHubUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GitHubUser;
  }

  @override
  void update(void Function(GitHubUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GitHubUser build() {
    final _$result =
        _$v ?? new _$GitHubUser._(login: login, avatarUrl: avatarUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
