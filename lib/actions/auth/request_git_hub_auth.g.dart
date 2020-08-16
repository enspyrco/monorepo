// GENERATED CODE - DO NOT MODIFY BY HAND

part of request_git_hub_auth;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RequestGitHubAuth> _$requestGitHubAuthSerializer =
    new _$RequestGitHubAuthSerializer();

class _$RequestGitHubAuthSerializer
    implements StructuredSerializer<RequestGitHubAuth> {
  @override
  final Iterable<Type> types = const [RequestGitHubAuth, _$RequestGitHubAuth];
  @override
  final String wireName = 'RequestGitHubAuth';

  @override
  Iterable<Object> serialize(Serializers serializers, RequestGitHubAuth object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  RequestGitHubAuth deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new RequestGitHubAuthBuilder().build();
  }
}

class _$RequestGitHubAuth extends RequestGitHubAuth {
  factory _$RequestGitHubAuth(
          [void Function(RequestGitHubAuthBuilder) updates]) =>
      (new RequestGitHubAuthBuilder()..update(updates)).build();

  _$RequestGitHubAuth._() : super._();

  @override
  RequestGitHubAuth rebuild(void Function(RequestGitHubAuthBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestGitHubAuthBuilder toBuilder() =>
      new RequestGitHubAuthBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestGitHubAuth;
  }

  @override
  int get hashCode {
    return 403491030;
  }
}

class RequestGitHubAuthBuilder
    implements Builder<RequestGitHubAuth, RequestGitHubAuthBuilder> {
  _$RequestGitHubAuth _$v;

  RequestGitHubAuthBuilder();

  @override
  void replace(RequestGitHubAuth other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RequestGitHubAuth;
  }

  @override
  void update(void Function(RequestGitHubAuthBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RequestGitHubAuth build() {
    final _$result = _$v ?? new _$RequestGitHubAuth._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
