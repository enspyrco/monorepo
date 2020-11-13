// GENERATED CODE - DO NOT MODIFY BY HAND

part of plumb_streams;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlumbStreams> _$plumbStreamsSerializer =
    new _$PlumbStreamsSerializer();

class _$PlumbStreamsSerializer implements StructuredSerializer<PlumbStreams> {
  @override
  final Iterable<Type> types = const [PlumbStreams, _$PlumbStreams];
  @override
  final String wireName = 'PlumbStreams';

  @override
  Iterable<Object> serialize(Serializers serializers, PlumbStreams object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  PlumbStreams deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new PlumbStreamsBuilder().build();
  }
}

class _$PlumbStreams extends PlumbStreams {
  factory _$PlumbStreams([void Function(PlumbStreamsBuilder) updates]) =>
      (new PlumbStreamsBuilder()..update(updates)).build();

  _$PlumbStreams._() : super._();

  @override
  PlumbStreams rebuild(void Function(PlumbStreamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlumbStreamsBuilder toBuilder() => new PlumbStreamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlumbStreams;
  }

  @override
  int get hashCode {
    return 609886900;
  }
}

class PlumbStreamsBuilder
    implements Builder<PlumbStreams, PlumbStreamsBuilder> {
  _$PlumbStreams _$v;

  PlumbStreamsBuilder();

  @override
  void replace(PlumbStreams other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PlumbStreams;
  }

  @override
  void update(void Function(PlumbStreamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlumbStreams build() {
    final _$result = _$v ?? new _$PlumbStreams._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
