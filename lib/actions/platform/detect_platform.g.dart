// GENERATED CODE - DO NOT MODIFY BY HAND

part of detect_platform;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DetectPlatform> _$detectPlatformSerializer =
    new _$DetectPlatformSerializer();

class _$DetectPlatformSerializer
    implements StructuredSerializer<DetectPlatform> {
  @override
  final Iterable<Type> types = const [DetectPlatform, _$DetectPlatform];
  @override
  final String wireName = 'DetectPlatform';

  @override
  Iterable<Object> serialize(Serializers serializers, DetectPlatform object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  DetectPlatform deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new DetectPlatformBuilder().build();
  }
}

class _$DetectPlatform extends DetectPlatform {
  factory _$DetectPlatform([void Function(DetectPlatformBuilder) updates]) =>
      (new DetectPlatformBuilder()..update(updates)).build();

  _$DetectPlatform._() : super._();

  @override
  DetectPlatform rebuild(void Function(DetectPlatformBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetectPlatformBuilder toBuilder() =>
      new DetectPlatformBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetectPlatform;
  }

  @override
  int get hashCode {
    return 243723639;
  }
}

class DetectPlatformBuilder
    implements Builder<DetectPlatform, DetectPlatformBuilder> {
  _$DetectPlatform _$v;

  DetectPlatformBuilder();

  @override
  void replace(DetectPlatform other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DetectPlatform;
  }

  @override
  void update(void Function(DetectPlatformBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DetectPlatform build() {
    final _$result = _$v ?? new _$DetectPlatform._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
