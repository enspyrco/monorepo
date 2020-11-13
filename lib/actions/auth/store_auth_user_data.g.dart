// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_auth_user_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreAuthUserData> _$storeAuthUserDataSerializer =
    new _$StoreAuthUserDataSerializer();

class _$StoreAuthUserDataSerializer
    implements StructuredSerializer<StoreAuthUserData> {
  @override
  final Iterable<Type> types = const [StoreAuthUserData, _$StoreAuthUserData];
  @override
  final String wireName = 'StoreAuthUserData';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreAuthUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.authUserData != null) {
      result
        ..add('authUserData')
        ..add(serializers.serialize(object.authUserData,
            specifiedType: const FullType(AuthUserData)));
    }
    return result;
  }

  @override
  StoreAuthUserData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreAuthUserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'authUserData':
          result.authUserData.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthUserData)) as AuthUserData);
          break;
      }
    }

    return result.build();
  }
}

class _$StoreAuthUserData extends StoreAuthUserData {
  @override
  final AuthUserData authUserData;

  factory _$StoreAuthUserData(
          [void Function(StoreAuthUserDataBuilder) updates]) =>
      (new StoreAuthUserDataBuilder()..update(updates)).build();

  _$StoreAuthUserData._({this.authUserData}) : super._();

  @override
  StoreAuthUserData rebuild(void Function(StoreAuthUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreAuthUserDataBuilder toBuilder() =>
      new StoreAuthUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreAuthUserData && authUserData == other.authUserData;
  }

  @override
  int get hashCode {
    return $jf($jc(0, authUserData.hashCode));
  }
}

class StoreAuthUserDataBuilder
    implements Builder<StoreAuthUserData, StoreAuthUserDataBuilder> {
  _$StoreAuthUserData _$v;

  AuthUserDataBuilder _authUserData;
  AuthUserDataBuilder get authUserData =>
      _$this._authUserData ??= new AuthUserDataBuilder();
  set authUserData(AuthUserDataBuilder authUserData) =>
      _$this._authUserData = authUserData;

  StoreAuthUserDataBuilder();

  StoreAuthUserDataBuilder get _$this {
    if (_$v != null) {
      _authUserData = _$v.authUserData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreAuthUserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreAuthUserData;
  }

  @override
  void update(void Function(StoreAuthUserDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreAuthUserData build() {
    _$StoreAuthUserData _$result;
    try {
      _$result = _$v ??
          new _$StoreAuthUserData._(authUserData: _authUserData?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authUserData';
        _authUserData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StoreAuthUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
