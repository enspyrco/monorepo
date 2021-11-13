// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfilePageData _$ProfilePageDataFromJson(Map<String, dynamic> json) {
  return _ProfilePageData.fromJson(json);
}

/// @nodoc
class _$ProfilePageDataTearOff {
  const _$ProfilePageDataTearOff();

  _ProfilePageData call() {
    return const _ProfilePageData();
  }

  ProfilePageData fromJson(Map<String, Object?> json) {
    return ProfilePageData.fromJson(json);
  }
}

/// @nodoc
const $ProfilePageData = _$ProfilePageDataTearOff();

/// @nodoc
mixin _$ProfilePageData {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePageDataCopyWith<$Res> {
  factory $ProfilePageDataCopyWith(
          ProfilePageData value, $Res Function(ProfilePageData) then) =
      _$ProfilePageDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfilePageDataCopyWithImpl<$Res>
    implements $ProfilePageDataCopyWith<$Res> {
  _$ProfilePageDataCopyWithImpl(this._value, this._then);

  final ProfilePageData _value;
  // ignore: unused_field
  final $Res Function(ProfilePageData) _then;
}

/// @nodoc
abstract class _$ProfilePageDataCopyWith<$Res> {
  factory _$ProfilePageDataCopyWith(
          _ProfilePageData value, $Res Function(_ProfilePageData) then) =
      __$ProfilePageDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$ProfilePageDataCopyWithImpl<$Res>
    extends _$ProfilePageDataCopyWithImpl<$Res>
    implements _$ProfilePageDataCopyWith<$Res> {
  __$ProfilePageDataCopyWithImpl(
      _ProfilePageData _value, $Res Function(_ProfilePageData) _then)
      : super(_value, (v) => _then(v as _ProfilePageData));

  @override
  _ProfilePageData get _value => super._value as _ProfilePageData;
}

/// @nodoc
@JsonSerializable()
class _$_ProfilePageData extends _ProfilePageData {
  const _$_ProfilePageData() : super._();

  factory _$_ProfilePageData.fromJson(Map<String, dynamic> json) =>
      _$$_ProfilePageDataFromJson(json);

  @override
  String toString() {
    return 'ProfilePageData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ProfilePageData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfilePageDataToJson(this);
  }
}

abstract class _ProfilePageData extends ProfilePageData {
  const factory _ProfilePageData() = _$_ProfilePageData;
  const _ProfilePageData._() : super._();

  factory _ProfilePageData.fromJson(Map<String, dynamic> json) =
      _$_ProfilePageData.fromJson;
}
