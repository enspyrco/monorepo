// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_profile_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreProfileData> _$storeProfileDataSerializer =
    new _$StoreProfileDataSerializer();

class _$StoreProfileDataSerializer
    implements StructuredSerializer<StoreProfileData> {
  @override
  final Iterable<Type> types = const [StoreProfileData, _$StoreProfileData];
  @override
  final String wireName = 'StoreProfileData';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(ProfileData)),
    ];

    return result;
  }

  @override
  StoreProfileData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreProfileDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProfileData)) as ProfileData);
          break;
      }
    }

    return result.build();
  }
}

class _$StoreProfileData extends StoreProfileData {
  @override
  final ProfileData data;

  factory _$StoreProfileData(
          [void Function(StoreProfileDataBuilder) updates]) =>
      (new StoreProfileDataBuilder()..update(updates)).build();

  _$StoreProfileData._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('StoreProfileData', 'data');
    }
  }

  @override
  StoreProfileData rebuild(void Function(StoreProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreProfileDataBuilder toBuilder() =>
      new StoreProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreProfileData && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }
}

class StoreProfileDataBuilder
    implements Builder<StoreProfileData, StoreProfileDataBuilder> {
  _$StoreProfileData _$v;

  ProfileDataBuilder _data;
  ProfileDataBuilder get data => _$this._data ??= new ProfileDataBuilder();
  set data(ProfileDataBuilder data) => _$this._data = data;

  StoreProfileDataBuilder();

  StoreProfileDataBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreProfileData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreProfileData;
  }

  @override
  void update(void Function(StoreProfileDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreProfileData build() {
    _$StoreProfileData _$result;
    try {
      _$result = _$v ?? new _$StoreProfileData._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StoreProfileData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
