// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'initial_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InitialPageData _$InitialPageDataFromJson(Map<String, dynamic> json) {
  return _InitialPageData.fromJson(json);
}

/// @nodoc
class _$InitialPageDataTearOff {
  const _$InitialPageDataTearOff();

  _InitialPageData call() {
    return _InitialPageData();
  }

  InitialPageData fromJson(Map<String, Object> json) {
    return InitialPageData.fromJson(json);
  }
}

/// @nodoc
const $InitialPageData = _$InitialPageDataTearOff();

/// @nodoc
mixin _$InitialPageData {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialPageDataCopyWith<$Res> {
  factory $InitialPageDataCopyWith(
          InitialPageData value, $Res Function(InitialPageData) then) =
      _$InitialPageDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialPageDataCopyWithImpl<$Res>
    implements $InitialPageDataCopyWith<$Res> {
  _$InitialPageDataCopyWithImpl(this._value, this._then);

  final InitialPageData _value;
  // ignore: unused_field
  final $Res Function(InitialPageData) _then;
}

/// @nodoc
abstract class _$InitialPageDataCopyWith<$Res> {
  factory _$InitialPageDataCopyWith(
          _InitialPageData value, $Res Function(_InitialPageData) then) =
      __$InitialPageDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialPageDataCopyWithImpl<$Res>
    extends _$InitialPageDataCopyWithImpl<$Res>
    implements _$InitialPageDataCopyWith<$Res> {
  __$InitialPageDataCopyWithImpl(
      _InitialPageData _value, $Res Function(_InitialPageData) _then)
      : super(_value, (v) => _then(v as _InitialPageData));

  @override
  _InitialPageData get _value => super._value as _InitialPageData;
}

/// @nodoc
@JsonSerializable()
class _$_InitialPageData extends _InitialPageData {
  _$_InitialPageData() : super._();

  factory _$_InitialPageData.fromJson(Map<String, dynamic> json) =>
      _$$_InitialPageDataFromJson(json);

  @override
  String toString() {
    return 'InitialPageData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InitialPageData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_InitialPageDataToJson(this);
  }
}

abstract class _InitialPageData extends InitialPageData {
  factory _InitialPageData() = _$_InitialPageData;
  _InitialPageData._() : super._();

  factory _InitialPageData.fromJson(Map<String, dynamic> json) =
      _$_InitialPageData.fromJson;
}
