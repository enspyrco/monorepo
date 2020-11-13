// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_enum.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PlatformEnum _$web = const PlatformEnum._('web');
const PlatformEnum _$android = const PlatformEnum._('android');
const PlatformEnum _$iOS = const PlatformEnum._('iOS');
const PlatformEnum _$macOS = const PlatformEnum._('macOS');
const PlatformEnum _$fuchsia = const PlatformEnum._('fuchsia');
const PlatformEnum _$linux = const PlatformEnum._('linux');
const PlatformEnum _$windows = const PlatformEnum._('windows');
const PlatformEnum _$unknown = const PlatformEnum._('unknown');

PlatformEnum _$valueOf(String name) {
  switch (name) {
    case 'web':
      return _$web;
    case 'android':
      return _$android;
    case 'iOS':
      return _$iOS;
    case 'macOS':
      return _$macOS;
    case 'fuchsia':
      return _$fuchsia;
    case 'linux':
      return _$linux;
    case 'windows':
      return _$windows;
    case 'unknown':
      return _$unknown;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PlatformEnum> _$values =
    new BuiltSet<PlatformEnum>(const <PlatformEnum>[
  _$web,
  _$android,
  _$iOS,
  _$macOS,
  _$fuchsia,
  _$linux,
  _$windows,
  _$unknown,
]);

Serializer<PlatformEnum> _$platformEnumSerializer =
    new _$PlatformEnumSerializer();

class _$PlatformEnumSerializer implements PrimitiveSerializer<PlatformEnum> {
  @override
  final Iterable<Type> types = const <Type>[PlatformEnum];
  @override
  final String wireName = 'PlatformEnum';

  @override
  Object serialize(Serializers serializers, PlatformEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PlatformEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PlatformEnum.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
