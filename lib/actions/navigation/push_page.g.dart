// GENERATED CODE - DO NOT MODIFY BY HAND

part of push_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PushPage> _$pushPageSerializer = new _$PushPageSerializer();

class _$PushPageSerializer implements StructuredSerializer<PushPage> {
  @override
  final Iterable<Type> types = const [PushPage, _$PushPage];
  @override
  final String wireName = 'PushPage';

  @override
  Iterable<Object> serialize(Serializers serializers, PushPage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(PageData)),
    ];

    return result;
  }

  @override
  PushPage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PushPageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(PageData)) as PageData;
          break;
      }
    }

    return result.build();
  }
}

class _$PushPage extends PushPage {
  @override
  final PageData data;

  factory _$PushPage([void Function(PushPageBuilder) updates]) =>
      (new PushPageBuilder()..update(updates)).build();

  _$PushPage._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('PushPage', 'data');
    }
  }

  @override
  PushPage rebuild(void Function(PushPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PushPageBuilder toBuilder() => new PushPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PushPage && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }
}

class PushPageBuilder implements Builder<PushPage, PushPageBuilder> {
  _$PushPage _$v;

  PageData _data;
  PageData get data => _$this._data;
  set data(PageData data) => _$this._data = data;

  PushPageBuilder();

  PushPageBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PushPage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PushPage;
  }

  @override
  void update(void Function(PushPageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PushPage build() {
    final _$result = _$v ?? new _$PushPage._(data: data);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
