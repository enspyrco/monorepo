// GENERATED CODE - DO NOT MODIFY BY HAND

part of connect_auth_state_to_store;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConnectAuthStateToStore> _$connectAuthStateToStoreSerializer =
    new _$ConnectAuthStateToStoreSerializer();

class _$ConnectAuthStateToStoreSerializer
    implements StructuredSerializer<ConnectAuthStateToStore> {
  @override
  final Iterable<Type> types = const [
    ConnectAuthStateToStore,
    _$ConnectAuthStateToStore
  ];
  @override
  final String wireName = 'ConnectAuthStateToStore';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConnectAuthStateToStore object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ConnectAuthStateToStore deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ConnectAuthStateToStoreBuilder().build();
  }
}

class _$ConnectAuthStateToStore extends ConnectAuthStateToStore {
  factory _$ConnectAuthStateToStore(
          [void Function(ConnectAuthStateToStoreBuilder) updates]) =>
      (new ConnectAuthStateToStoreBuilder()..update(updates)).build();

  _$ConnectAuthStateToStore._() : super._();

  @override
  ConnectAuthStateToStore rebuild(
          void Function(ConnectAuthStateToStoreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectAuthStateToStoreBuilder toBuilder() =>
      new ConnectAuthStateToStoreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectAuthStateToStore;
  }

  @override
  int get hashCode {
    return 114635078;
  }
}

class ConnectAuthStateToStoreBuilder
    implements
        Builder<ConnectAuthStateToStore, ConnectAuthStateToStoreBuilder> {
  _$ConnectAuthStateToStore _$v;

  ConnectAuthStateToStoreBuilder();

  @override
  void replace(ConnectAuthStateToStore other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConnectAuthStateToStore;
  }

  @override
  void update(void Function(ConnectAuthStateToStoreBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConnectAuthStateToStore build() {
    final _$result = _$v ?? new _$ConnectAuthStateToStore._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
