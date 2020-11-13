// GENERATED CODE - DO NOT MODIFY BY HAND

part of initial_page_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitialPageData> _$initialPageDataSerializer =
    new _$InitialPageDataSerializer();

class _$InitialPageDataSerializer
    implements StructuredSerializer<InitialPageData> {
  @override
  final Iterable<Type> types = const [InitialPageData, _$InitialPageData];
  @override
  final String wireName = 'InitialPageData';

  @override
  Iterable<Object> serialize(Serializers serializers, InitialPageData object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  InitialPageData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new InitialPageDataBuilder().build();
  }
}

class _$InitialPageData extends InitialPageData {
  factory _$InitialPageData([void Function(InitialPageDataBuilder) updates]) =>
      (new InitialPageDataBuilder()..update(updates)).build();

  _$InitialPageData._() : super._();

  @override
  InitialPageData rebuild(void Function(InitialPageDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitialPageDataBuilder toBuilder() =>
      new InitialPageDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitialPageData;
  }

  @override
  int get hashCode {
    return 787598654;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('InitialPageData').toString();
  }
}

class InitialPageDataBuilder
    implements
        Builder<InitialPageData, InitialPageDataBuilder>,
        PageDataBuilder {
  _$InitialPageData _$v;

  InitialPageDataBuilder();

  @override
  void replace(covariant InitialPageData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitialPageData;
  }

  @override
  void update(void Function(InitialPageDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitialPageData build() {
    final _$result = _$v ?? new _$InitialPageData._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
