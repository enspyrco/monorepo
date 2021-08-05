// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThemeColors _$ThemeColorsFromJson(Map<String, dynamic> json) {
  return _ThemeColors.fromJson(json);
}

/// @nodoc
class _$ThemeColorsTearOff {
  const _$ThemeColorsTearOff();

  _ThemeColors call(
      {required int primary, required int secondary, required int error}) {
    return _ThemeColors(
      primary: primary,
      secondary: secondary,
      error: error,
    );
  }

  ThemeColors fromJson(Map<String, Object> json) {
    return ThemeColors.fromJson(json);
  }
}

/// @nodoc
const $ThemeColors = _$ThemeColorsTearOff();

/// @nodoc
mixin _$ThemeColors {
  int get primary => throw _privateConstructorUsedError;
  int get secondary => throw _privateConstructorUsedError;
  int get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeColorsCopyWith<ThemeColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeColorsCopyWith<$Res> {
  factory $ThemeColorsCopyWith(
          ThemeColors value, $Res Function(ThemeColors) then) =
      _$ThemeColorsCopyWithImpl<$Res>;
  $Res call({int primary, int secondary, int error});
}

/// @nodoc
class _$ThemeColorsCopyWithImpl<$Res> implements $ThemeColorsCopyWith<$Res> {
  _$ThemeColorsCopyWithImpl(this._value, this._then);

  final ThemeColors _value;
  // ignore: unused_field
  final $Res Function(ThemeColors) _then;

  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      primary: primary == freezed
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as int,
      secondary: secondary == freezed
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ThemeColorsCopyWith<$Res>
    implements $ThemeColorsCopyWith<$Res> {
  factory _$ThemeColorsCopyWith(
          _ThemeColors value, $Res Function(_ThemeColors) then) =
      __$ThemeColorsCopyWithImpl<$Res>;
  @override
  $Res call({int primary, int secondary, int error});
}

/// @nodoc
class __$ThemeColorsCopyWithImpl<$Res> extends _$ThemeColorsCopyWithImpl<$Res>
    implements _$ThemeColorsCopyWith<$Res> {
  __$ThemeColorsCopyWithImpl(
      _ThemeColors _value, $Res Function(_ThemeColors) _then)
      : super(_value, (v) => _then(v as _ThemeColors));

  @override
  _ThemeColors get _value => super._value as _ThemeColors;

  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? error = freezed,
  }) {
    return _then(_ThemeColors(
      primary: primary == freezed
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as int,
      secondary: secondary == freezed
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThemeColors implements _ThemeColors {
  _$_ThemeColors(
      {required this.primary, required this.secondary, required this.error});

  factory _$_ThemeColors.fromJson(Map<String, dynamic> json) =>
      _$$_ThemeColorsFromJson(json);

  @override
  final int primary;
  @override
  final int secondary;
  @override
  final int error;

  @override
  String toString() {
    return 'ThemeColors(primary: $primary, secondary: $secondary, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeColors &&
            (identical(other.primary, primary) ||
                const DeepCollectionEquality()
                    .equals(other.primary, primary)) &&
            (identical(other.secondary, secondary) ||
                const DeepCollectionEquality()
                    .equals(other.secondary, secondary)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(primary) ^
      const DeepCollectionEquality().hash(secondary) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$ThemeColorsCopyWith<_ThemeColors> get copyWith =>
      __$ThemeColorsCopyWithImpl<_ThemeColors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThemeColorsToJson(this);
  }
}

abstract class _ThemeColors implements ThemeColors {
  factory _ThemeColors(
      {required int primary,
      required int secondary,
      required int error}) = _$_ThemeColors;

  factory _ThemeColors.fromJson(Map<String, dynamic> json) =
      _$_ThemeColors.fromJson;

  @override
  int get primary => throw _privateConstructorUsedError;
  @override
  int get secondary => throw _privateConstructorUsedError;
  @override
  int get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThemeColorsCopyWith<_ThemeColors> get copyWith =>
      throw _privateConstructorUsedError;
}
