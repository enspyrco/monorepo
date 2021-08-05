// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThemeSet _$ThemeSetFromJson(Map<String, dynamic> json) {
  return _ThemeSet.fromJson(json);
}

/// @nodoc
class _$ThemeSetTearOff {
  const _$ThemeSetTearOff();

  _ThemeSet call(
      {required ThemeColors colors, required ThemeBrightnessEnum brightness}) {
    return _ThemeSet(
      colors: colors,
      brightness: brightness,
    );
  }

  ThemeSet fromJson(Map<String, Object> json) {
    return ThemeSet.fromJson(json);
  }
}

/// @nodoc
const $ThemeSet = _$ThemeSetTearOff();

/// @nodoc
mixin _$ThemeSet {
  ThemeColors get colors => throw _privateConstructorUsedError;
  ThemeBrightnessEnum get brightness => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeSetCopyWith<ThemeSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeSetCopyWith<$Res> {
  factory $ThemeSetCopyWith(ThemeSet value, $Res Function(ThemeSet) then) =
      _$ThemeSetCopyWithImpl<$Res>;
  $Res call({ThemeColors colors, ThemeBrightnessEnum brightness});

  $ThemeColorsCopyWith<$Res> get colors;
}

/// @nodoc
class _$ThemeSetCopyWithImpl<$Res> implements $ThemeSetCopyWith<$Res> {
  _$ThemeSetCopyWithImpl(this._value, this._then);

  final ThemeSet _value;
  // ignore: unused_field
  final $Res Function(ThemeSet) _then;

  @override
  $Res call({
    Object? colors = freezed,
    Object? brightness = freezed,
  }) {
    return _then(_value.copyWith(
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ThemeColors,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as ThemeBrightnessEnum,
    ));
  }

  @override
  $ThemeColorsCopyWith<$Res> get colors {
    return $ThemeColorsCopyWith<$Res>(_value.colors, (value) {
      return _then(_value.copyWith(colors: value));
    });
  }
}

/// @nodoc
abstract class _$ThemeSetCopyWith<$Res> implements $ThemeSetCopyWith<$Res> {
  factory _$ThemeSetCopyWith(_ThemeSet value, $Res Function(_ThemeSet) then) =
      __$ThemeSetCopyWithImpl<$Res>;
  @override
  $Res call({ThemeColors colors, ThemeBrightnessEnum brightness});

  @override
  $ThemeColorsCopyWith<$Res> get colors;
}

/// @nodoc
class __$ThemeSetCopyWithImpl<$Res> extends _$ThemeSetCopyWithImpl<$Res>
    implements _$ThemeSetCopyWith<$Res> {
  __$ThemeSetCopyWithImpl(_ThemeSet _value, $Res Function(_ThemeSet) _then)
      : super(_value, (v) => _then(v as _ThemeSet));

  @override
  _ThemeSet get _value => super._value as _ThemeSet;

  @override
  $Res call({
    Object? colors = freezed,
    Object? brightness = freezed,
  }) {
    return _then(_ThemeSet(
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ThemeColors,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as ThemeBrightnessEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThemeSet implements _ThemeSet {
  _$_ThemeSet({required this.colors, required this.brightness});

  factory _$_ThemeSet.fromJson(Map<String, dynamic> json) =>
      _$$_ThemeSetFromJson(json);

  @override
  final ThemeColors colors;
  @override
  final ThemeBrightnessEnum brightness;

  @override
  String toString() {
    return 'ThemeSet(colors: $colors, brightness: $brightness)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeSet &&
            (identical(other.colors, colors) ||
                const DeepCollectionEquality().equals(other.colors, colors)) &&
            (identical(other.brightness, brightness) ||
                const DeepCollectionEquality()
                    .equals(other.brightness, brightness)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(colors) ^
      const DeepCollectionEquality().hash(brightness);

  @JsonKey(ignore: true)
  @override
  _$ThemeSetCopyWith<_ThemeSet> get copyWith =>
      __$ThemeSetCopyWithImpl<_ThemeSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThemeSetToJson(this);
  }
}

abstract class _ThemeSet implements ThemeSet {
  factory _ThemeSet(
      {required ThemeColors colors,
      required ThemeBrightnessEnum brightness}) = _$_ThemeSet;

  factory _ThemeSet.fromJson(Map<String, dynamic> json) = _$_ThemeSet.fromJson;

  @override
  ThemeColors get colors => throw _privateConstructorUsedError;
  @override
  ThemeBrightnessEnum get brightness => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThemeSetCopyWith<_ThemeSet> get copyWith =>
      throw _privateConstructorUsedError;
}
