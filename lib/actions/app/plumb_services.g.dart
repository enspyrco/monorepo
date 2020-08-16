// GENERATED CODE - DO NOT MODIFY BY HAND

part of plumb_services;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlumbServices> _$plumbServicesSerializer =
    new _$PlumbServicesSerializer();

class _$PlumbServicesSerializer implements StructuredSerializer<PlumbServices> {
  @override
  final Iterable<Type> types = const [PlumbServices, _$PlumbServices];
  @override
  final String wireName = 'PlumbServices';

  @override
  Iterable<Object> serialize(Serializers serializers, PlumbServices object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  PlumbServices deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new PlumbServicesBuilder().build();
  }
}

class _$PlumbServices extends PlumbServices {
  factory _$PlumbServices([void Function(PlumbServicesBuilder) updates]) =>
      (new PlumbServicesBuilder()..update(updates)).build();

  _$PlumbServices._() : super._();

  @override
  PlumbServices rebuild(void Function(PlumbServicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlumbServicesBuilder toBuilder() => new PlumbServicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlumbServices;
  }

  @override
  int get hashCode {
    return 848030702;
  }
}

class PlumbServicesBuilder
    implements Builder<PlumbServices, PlumbServicesBuilder> {
  _$PlumbServices _$v;

  PlumbServicesBuilder();

  @override
  void replace(PlumbServices other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PlumbServices;
  }

  @override
  void update(void Function(PlumbServicesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlumbServices build() {
    final _$result = _$v ?? new _$PlumbServices._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
