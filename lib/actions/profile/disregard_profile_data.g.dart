// GENERATED CODE - DO NOT MODIFY BY HAND

part of disregard_profile_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DisregardProfileData> _$disregardProfileDataSerializer =
    new _$DisregardProfileDataSerializer();

class _$DisregardProfileDataSerializer
    implements StructuredSerializer<DisregardProfileData> {
  @override
  final Iterable<Type> types = const [
    DisregardProfileData,
    _$DisregardProfileData
  ];
  @override
  final String wireName = 'DisregardProfileData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DisregardProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  DisregardProfileData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new DisregardProfileDataBuilder().build();
  }
}

class _$DisregardProfileData extends DisregardProfileData {
  factory _$DisregardProfileData(
          [void Function(DisregardProfileDataBuilder) updates]) =>
      (new DisregardProfileDataBuilder()..update(updates)).build();

  _$DisregardProfileData._() : super._();

  @override
  DisregardProfileData rebuild(
          void Function(DisregardProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DisregardProfileDataBuilder toBuilder() =>
      new DisregardProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DisregardProfileData;
  }

  @override
  int get hashCode {
    return 695920103;
  }
}

class DisregardProfileDataBuilder
    implements Builder<DisregardProfileData, DisregardProfileDataBuilder> {
  _$DisregardProfileData _$v;

  DisregardProfileDataBuilder();

  @override
  void replace(DisregardProfileData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DisregardProfileData;
  }

  @override
  void update(void Function(DisregardProfileDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DisregardProfileData build() {
    final _$result = _$v ?? new _$DisregardProfileData._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
