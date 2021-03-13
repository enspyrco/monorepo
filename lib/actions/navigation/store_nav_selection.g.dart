// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_nav_selection;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreNavSelection> _$storeNavSelectionSerializer =
    new _$StoreNavSelectionSerializer();

class _$StoreNavSelectionSerializer
    implements StructuredSerializer<StoreNavSelection> {
  @override
  final Iterable<Type> types = const [StoreNavSelection, _$StoreNavSelection];
  @override
  final String wireName = 'StoreNavSelection';

  @override
  Iterable<Object?> serialize(Serializers serializers, StoreNavSelection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'selection',
      serializers.serialize(object.selection,
          specifiedType: const FullType(NavSelection)),
    ];

    return result;
  }

  @override
  StoreNavSelection deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreNavSelectionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'selection':
          result.selection = serializers.deserialize(value,
              specifiedType: const FullType(NavSelection)) as NavSelection;
          break;
      }
    }

    return result.build();
  }
}

class _$StoreNavSelection extends StoreNavSelection {
  @override
  final NavSelection selection;

  factory _$StoreNavSelection(
          [void Function(StoreNavSelectionBuilder)? updates]) =>
      (new StoreNavSelectionBuilder()..update(updates)).build();

  _$StoreNavSelection._({required this.selection}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        selection, 'StoreNavSelection', 'selection');
  }

  @override
  StoreNavSelection rebuild(void Function(StoreNavSelectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreNavSelectionBuilder toBuilder() =>
      new StoreNavSelectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreNavSelection && selection == other.selection;
  }

  @override
  int get hashCode {
    return $jf($jc(0, selection.hashCode));
  }
}

class StoreNavSelectionBuilder
    implements Builder<StoreNavSelection, StoreNavSelectionBuilder> {
  _$StoreNavSelection? _$v;

  NavSelection? _selection;
  NavSelection? get selection => _$this._selection;
  set selection(NavSelection? selection) => _$this._selection = selection;

  StoreNavSelectionBuilder();

  StoreNavSelectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _selection = $v.selection;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreNavSelection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoreNavSelection;
  }

  @override
  void update(void Function(StoreNavSelectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreNavSelection build() {
    final _$result = _$v ??
        new _$StoreNavSelection._(
            selection: BuiltValueNullFieldError.checkNotNull(
                selection, 'StoreNavSelection', 'selection'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
