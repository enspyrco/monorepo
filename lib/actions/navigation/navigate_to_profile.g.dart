// GENERATED CODE - DO NOT MODIFY BY HAND

part of navigate_to_profile;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NavigateToProfile> _$navigateToProfileSerializer =
    new _$NavigateToProfileSerializer();

class _$NavigateToProfileSerializer
    implements StructuredSerializer<NavigateToProfile> {
  @override
  final Iterable<Type> types = const [NavigateToProfile, _$NavigateToProfile];
  @override
  final String wireName = 'NavigateToProfile';

  @override
  Iterable<Object> serialize(Serializers serializers, NavigateToProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  NavigateToProfile deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new NavigateToProfileBuilder().build();
  }
}

class _$NavigateToProfile extends NavigateToProfile {
  factory _$NavigateToProfile(
          [void Function(NavigateToProfileBuilder) updates]) =>
      (new NavigateToProfileBuilder()..update(updates)).build();

  _$NavigateToProfile._() : super._();

  @override
  NavigateToProfile rebuild(void Function(NavigateToProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigateToProfileBuilder toBuilder() =>
      new NavigateToProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigateToProfile;
  }

  @override
  int get hashCode {
    return 212339143;
  }
}

class NavigateToProfileBuilder
    implements Builder<NavigateToProfile, NavigateToProfileBuilder> {
  _$NavigateToProfile _$v;

  NavigateToProfileBuilder();

  @override
  void replace(NavigateToProfile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavigateToProfile;
  }

  @override
  void update(void Function(NavigateToProfileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavigateToProfile build() {
    final _$result = _$v ?? new _$NavigateToProfile._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
