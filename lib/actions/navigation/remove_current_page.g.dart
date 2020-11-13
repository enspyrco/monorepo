// GENERATED CODE - DO NOT MODIFY BY HAND

part of remove_current_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RemoveCurrentPage> _$removeCurrentPageSerializer =
    new _$RemoveCurrentPageSerializer();

class _$RemoveCurrentPageSerializer
    implements StructuredSerializer<RemoveCurrentPage> {
  @override
  final Iterable<Type> types = const [RemoveCurrentPage, _$RemoveCurrentPage];
  @override
  final String wireName = 'RemoveCurrentPage';

  @override
  Iterable<Object> serialize(Serializers serializers, RemoveCurrentPage object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  RemoveCurrentPage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new RemoveCurrentPageBuilder().build();
  }
}

class _$RemoveCurrentPage extends RemoveCurrentPage {
  factory _$RemoveCurrentPage(
          [void Function(RemoveCurrentPageBuilder) updates]) =>
      (new RemoveCurrentPageBuilder()..update(updates)).build();

  _$RemoveCurrentPage._() : super._();

  @override
  RemoveCurrentPage rebuild(void Function(RemoveCurrentPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveCurrentPageBuilder toBuilder() =>
      new RemoveCurrentPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveCurrentPage;
  }

  @override
  int get hashCode {
    return 269908377;
  }
}

class RemoveCurrentPageBuilder
    implements Builder<RemoveCurrentPage, RemoveCurrentPageBuilder> {
  _$RemoveCurrentPage _$v;

  RemoveCurrentPageBuilder();

  @override
  void replace(RemoveCurrentPage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoveCurrentPage;
  }

  @override
  void update(void Function(RemoveCurrentPageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoveCurrentPage build() {
    final _$result = _$v ?? new _$RemoveCurrentPage._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
