// GENERATED CODE - DO NOT MODIFY BY HAND

part of profile_page_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfilePageData> _$profilePageDataSerializer =
    new _$ProfilePageDataSerializer();

class _$ProfilePageDataSerializer
    implements StructuredSerializer<ProfilePageData> {
  @override
  final Iterable<Type> types = const [ProfilePageData, _$ProfilePageData];
  @override
  final String wireName = 'ProfilePageData';

  @override
  Iterable<Object> serialize(Serializers serializers, ProfilePageData object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  ProfilePageData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ProfilePageDataBuilder().build();
  }
}

class _$ProfilePageData extends ProfilePageData {
  factory _$ProfilePageData([void Function(ProfilePageDataBuilder) updates]) =>
      (new ProfilePageDataBuilder()..update(updates)).build();

  _$ProfilePageData._() : super._();

  @override
  ProfilePageData rebuild(void Function(ProfilePageDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfilePageDataBuilder toBuilder() =>
      new ProfilePageDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfilePageData;
  }

  @override
  int get hashCode {
    return 223872371;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ProfilePageData').toString();
  }
}

class ProfilePageDataBuilder
    implements
        Builder<ProfilePageData, ProfilePageDataBuilder>,
        PageDataBuilder {
  _$ProfilePageData _$v;

  ProfilePageDataBuilder();

  @override
  void replace(covariant ProfilePageData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfilePageData;
  }

  @override
  void update(void Function(ProfilePageDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfilePageData build() {
    final _$result = _$v ?? new _$ProfilePageData._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
