// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_selection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NavSelection _$local = const NavSelection._('local');
const NavSelection _$github = const NavSelection._('github');
const NavSelection _$profile = const NavSelection._('profile');

NavSelection _$valueOf(String name) {
  switch (name) {
    case 'local':
      return _$local;
    case 'github':
      return _$github;
    case 'profile':
      return _$profile;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<NavSelection> _$values =
    new BuiltSet<NavSelection>(const <NavSelection>[
  _$local,
  _$github,
  _$profile,
]);

Serializer<NavSelection> _$navSelectionSerializer =
    new _$NavSelectionSerializer();

class _$NavSelectionSerializer implements PrimitiveSerializer<NavSelection> {
  @override
  final Iterable<Type> types = const <Type>[NavSelection];
  @override
  final String wireName = 'NavSelection';

  @override
  Object serialize(Serializers serializers, NavSelection object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NavSelection deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NavSelection.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
