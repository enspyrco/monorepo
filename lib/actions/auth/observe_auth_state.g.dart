// GENERATED CODE - DO NOT MODIFY BY HAND

part of observe_auth_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ObserveAuthState> _$observeAuthStateSerializer =
    new _$ObserveAuthStateSerializer();

class _$ObserveAuthStateSerializer
    implements StructuredSerializer<ObserveAuthState> {
  @override
  final Iterable<Type> types = const [ObserveAuthState, _$ObserveAuthState];
  @override
  final String wireName = 'ObserveAuthState';

  @override
  Iterable<Object> serialize(Serializers serializers, ObserveAuthState object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ObserveAuthState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ObserveAuthStateBuilder().build();
  }
}

class _$ObserveAuthState extends ObserveAuthState {
  factory _$ObserveAuthState(
          [void Function(ObserveAuthStateBuilder) updates]) =>
      (new ObserveAuthStateBuilder()..update(updates)).build();

  _$ObserveAuthState._() : super._();

  @override
  ObserveAuthState rebuild(void Function(ObserveAuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ObserveAuthStateBuilder toBuilder() =>
      new ObserveAuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObserveAuthState;
  }

  @override
  int get hashCode {
    return 929022149;
  }
}

class ObserveAuthStateBuilder
    implements Builder<ObserveAuthState, ObserveAuthStateBuilder> {
  _$ObserveAuthState _$v;

  ObserveAuthStateBuilder();

  @override
  void replace(ObserveAuthState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ObserveAuthState;
  }

  @override
  void update(void Function(ObserveAuthStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ObserveAuthState build() {
    final _$result = _$v ?? new _$ObserveAuthState._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
