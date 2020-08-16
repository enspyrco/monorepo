// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_user_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreUserData> _$storeUserDataSerializer =
    new _$StoreUserDataSerializer();

class _$StoreUserDataSerializer implements StructuredSerializer<StoreUserData> {
  @override
  final Iterable<Type> types = const [StoreUserData, _$StoreUserData];
  @override
  final String wireName = 'StoreUserData';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.userData != null) {
      result
        ..add('userData')
        ..add(serializers.serialize(object.userData,
            specifiedType: const FullType(UserData)));
    }
    return result;
  }

  @override
  StoreUserData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreUserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userData':
          result.userData.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserData)) as UserData);
          break;
      }
    }

    return result.build();
  }
}

class _$StoreUserData extends StoreUserData {
  @override
  final UserData userData;

  factory _$StoreUserData([void Function(StoreUserDataBuilder) updates]) =>
      (new StoreUserDataBuilder()..update(updates)).build();

  _$StoreUserData._({this.userData}) : super._();

  @override
  StoreUserData rebuild(void Function(StoreUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreUserDataBuilder toBuilder() => new StoreUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreUserData && userData == other.userData;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userData.hashCode));
  }
}

class StoreUserDataBuilder
    implements Builder<StoreUserData, StoreUserDataBuilder> {
  _$StoreUserData _$v;

  UserDataBuilder _userData;
  UserDataBuilder get userData => _$this._userData ??= new UserDataBuilder();
  set userData(UserDataBuilder userData) => _$this._userData = userData;

  StoreUserDataBuilder();

  StoreUserDataBuilder get _$this {
    if (_$v != null) {
      _userData = _$v.userData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreUserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreUserData;
  }

  @override
  void update(void Function(StoreUserDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreUserData build() {
    _$StoreUserData _$result;
    try {
      _$result = _$v ?? new _$StoreUserData._(userData: _userData?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userData';
        _userData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StoreUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
