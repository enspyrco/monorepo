// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_in_with_google;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignInWithGoogle> _$signInWithGoogleSerializer =
    new _$SignInWithGoogleSerializer();

class _$SignInWithGoogleSerializer
    implements StructuredSerializer<SignInWithGoogle> {
  @override
  final Iterable<Type> types = const [SignInWithGoogle, _$SignInWithGoogle];
  @override
  final String wireName = 'SignInWithGoogle';

  @override
  Iterable<Object> serialize(Serializers serializers, SignInWithGoogle object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  SignInWithGoogle deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new SignInWithGoogleBuilder().build();
  }
}

class _$SignInWithGoogle extends SignInWithGoogle {
  factory _$SignInWithGoogle(
          [void Function(SignInWithGoogleBuilder) updates]) =>
      (new SignInWithGoogleBuilder()..update(updates)).build();

  _$SignInWithGoogle._() : super._();

  @override
  SignInWithGoogle rebuild(void Function(SignInWithGoogleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInWithGoogleBuilder toBuilder() =>
      new SignInWithGoogleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInWithGoogle;
  }

  @override
  int get hashCode {
    return 36671587;
  }
}

class SignInWithGoogleBuilder
    implements Builder<SignInWithGoogle, SignInWithGoogleBuilder> {
  _$SignInWithGoogle _$v;

  SignInWithGoogleBuilder();

  @override
  void replace(SignInWithGoogle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInWithGoogle;
  }

  @override
  void update(void Function(SignInWithGoogleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInWithGoogle build() {
    final _$result = _$v ?? new _$SignInWithGoogle._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
