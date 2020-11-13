// GENERATED CODE - DO NOT MODIFY BY HAND

part of observe_profile_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ObserveProfileData> _$observeProfileDataSerializer =
    new _$ObserveProfileDataSerializer();

class _$ObserveProfileDataSerializer
    implements StructuredSerializer<ObserveProfileData> {
  @override
  final Iterable<Type> types = const [ObserveProfileData, _$ObserveProfileData];
  @override
  final String wireName = 'ObserveProfileData';

  @override
  Iterable<Object> serialize(Serializers serializers, ObserveProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ObserveProfileData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ObserveProfileDataBuilder().build();
  }
}

class _$ObserveProfileData extends ObserveProfileData {
  factory _$ObserveProfileData(
          [void Function(ObserveProfileDataBuilder) updates]) =>
      (new ObserveProfileDataBuilder()..update(updates)).build();

  _$ObserveProfileData._() : super._();

  @override
  ObserveProfileData rebuild(
          void Function(ObserveProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ObserveProfileDataBuilder toBuilder() =>
      new ObserveProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObserveProfileData;
  }

  @override
  int get hashCode {
    return 307114794;
  }
}

class ObserveProfileDataBuilder
    implements Builder<ObserveProfileData, ObserveProfileDataBuilder> {
  _$ObserveProfileData _$v;

  ObserveProfileDataBuilder();

  @override
  void replace(ObserveProfileData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ObserveProfileData;
  }

  @override
  void update(void Function(ObserveProfileDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ObserveProfileData build() {
    final _$result = _$v ?? new _$ObserveProfileData._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
