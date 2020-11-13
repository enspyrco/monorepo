// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_section.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DatabaseSection _$profileData = const DatabaseSection._('profileData');

DatabaseSection _$valueOf(String name) {
  switch (name) {
    case 'profileData':
      return _$profileData;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DatabaseSection> _$values =
    new BuiltSet<DatabaseSection>(const <DatabaseSection>[
  _$profileData,
]);

Serializer<DatabaseSection> _$databaseSectionSerializer =
    new _$DatabaseSectionSerializer();

class _$DatabaseSectionSerializer
    implements PrimitiveSerializer<DatabaseSection> {
  @override
  final Iterable<Type> types = const <Type>[DatabaseSection];
  @override
  final String wireName = 'DatabaseSection';

  @override
  Object serialize(Serializers serializers, DatabaseSection object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  DatabaseSection deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DatabaseSection.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
