// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_in_with_apple;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignInWithApple> _$signInWithAppleSerializer =
    new _$SignInWithAppleSerializer();

class _$SignInWithAppleSerializer
    implements StructuredSerializer<SignInWithApple> {
  @override
  final Iterable<Type> types = const [SignInWithApple, _$SignInWithApple];
  @override
  final String wireName = 'SignInWithApple';

  @override
  Iterable<Object> serialize(Serializers serializers, SignInWithApple object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  SignInWithApple deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new SignInWithAppleBuilder().build();
  }
}

class _$SignInWithApple extends SignInWithApple {
  factory _$SignInWithApple([void Function(SignInWithAppleBuilder) updates]) =>
      (new SignInWithAppleBuilder()..update(updates)).build();

  _$SignInWithApple._() : super._();

  @override
  SignInWithApple rebuild(void Function(SignInWithAppleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInWithAppleBuilder toBuilder() =>
      new SignInWithAppleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInWithApple;
  }

  @override
  int get hashCode {
    return 390606675;
  }
}

class SignInWithAppleBuilder
    implements Builder<SignInWithApple, SignInWithAppleBuilder> {
  _$SignInWithApple _$v;

  SignInWithAppleBuilder();

  @override
  void replace(SignInWithApple other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInWithApple;
  }

  @override
  void update(void Function(SignInWithAppleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInWithApple build() {
    final _$result = _$v ?? new _$SignInWithApple._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
