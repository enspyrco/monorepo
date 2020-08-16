// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_git_hub_token;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreGitHubToken> _$storeGitHubTokenSerializer =
    new _$StoreGitHubTokenSerializer();

class _$StoreGitHubTokenSerializer
    implements StructuredSerializer<StoreGitHubToken> {
  @override
  final Iterable<Type> types = const [StoreGitHubToken, _$StoreGitHubToken];
  @override
  final String wireName = 'StoreGitHubToken';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreGitHubToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  StoreGitHubToken deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreGitHubTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StoreGitHubToken extends StoreGitHubToken {
  @override
  final String token;

  factory _$StoreGitHubToken(
          [void Function(StoreGitHubTokenBuilder) updates]) =>
      (new StoreGitHubTokenBuilder()..update(updates)).build();

  _$StoreGitHubToken._({this.token}) : super._();

  @override
  StoreGitHubToken rebuild(void Function(StoreGitHubTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreGitHubTokenBuilder toBuilder() =>
      new StoreGitHubTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreGitHubToken && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }
}

class StoreGitHubTokenBuilder
    implements Builder<StoreGitHubToken, StoreGitHubTokenBuilder> {
  _$StoreGitHubToken _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  StoreGitHubTokenBuilder();

  StoreGitHubTokenBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreGitHubToken other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreGitHubToken;
  }

  @override
  void update(void Function(StoreGitHubTokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreGitHubToken build() {
    final _$result = _$v ?? new _$StoreGitHubToken._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
