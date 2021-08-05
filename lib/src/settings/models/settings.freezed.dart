// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
class _$SettingsTearOff {
  const _$SettingsTearOff();

  _Settings call(
      {required ThemeSet darkTheme,
      required ThemeSet lightTheme,
      required BrightnessModeEnum brightnessMode,
      required PlatformsEnum platform}) {
    return _Settings(
      darkTheme: darkTheme,
      lightTheme: lightTheme,
      brightnessMode: brightnessMode,
      platform: platform,
    );
  }

  Settings fromJson(Map<String, Object> json) {
    return Settings.fromJson(json);
  }
}

/// @nodoc
const $Settings = _$SettingsTearOff();

/// @nodoc
mixin _$Settings {
  ThemeSet get darkTheme => throw _privateConstructorUsedError;
  ThemeSet get lightTheme => throw _privateConstructorUsedError;
  BrightnessModeEnum get brightnessMode => throw _privateConstructorUsedError;
  PlatformsEnum get platform => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {ThemeSet darkTheme,
      ThemeSet lightTheme,
      BrightnessModeEnum brightnessMode,
      PlatformsEnum platform});

  $ThemeSetCopyWith<$Res> get darkTheme;
  $ThemeSetCopyWith<$Res> get lightTheme;
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? darkTheme = freezed,
    Object? lightTheme = freezed,
    Object? brightnessMode = freezed,
    Object? platform = freezed,
  }) {
    return _then(_value.copyWith(
      darkTheme: darkTheme == freezed
          ? _value.darkTheme
          : darkTheme // ignore: cast_nullable_to_non_nullable
              as ThemeSet,
      lightTheme: lightTheme == freezed
          ? _value.lightTheme
          : lightTheme // ignore: cast_nullable_to_non_nullable
              as ThemeSet,
      brightnessMode: brightnessMode == freezed
          ? _value.brightnessMode
          : brightnessMode // ignore: cast_nullable_to_non_nullable
              as BrightnessModeEnum,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformsEnum,
    ));
  }

  @override
  $ThemeSetCopyWith<$Res> get darkTheme {
    return $ThemeSetCopyWith<$Res>(_value.darkTheme, (value) {
      return _then(_value.copyWith(darkTheme: value));
    });
  }

  @override
  $ThemeSetCopyWith<$Res> get lightTheme {
    return $ThemeSetCopyWith<$Res>(_value.lightTheme, (value) {
      return _then(_value.copyWith(lightTheme: value));
    });
  }
}

/// @nodoc
abstract class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) then) =
      __$SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {ThemeSet darkTheme,
      ThemeSet lightTheme,
      BrightnessModeEnum brightnessMode,
      PlatformsEnum platform});

  @override
  $ThemeSetCopyWith<$Res> get darkTheme;
  @override
  $ThemeSetCopyWith<$Res> get lightTheme;
}

/// @nodoc
class __$SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(_Settings _value, $Res Function(_Settings) _then)
      : super(_value, (v) => _then(v as _Settings));

  @override
  _Settings get _value => super._value as _Settings;

  @override
  $Res call({
    Object? darkTheme = freezed,
    Object? lightTheme = freezed,
    Object? brightnessMode = freezed,
    Object? platform = freezed,
  }) {
    return _then(_Settings(
      darkTheme: darkTheme == freezed
          ? _value.darkTheme
          : darkTheme // ignore: cast_nullable_to_non_nullable
              as ThemeSet,
      lightTheme: lightTheme == freezed
          ? _value.lightTheme
          : lightTheme // ignore: cast_nullable_to_non_nullable
              as ThemeSet,
      brightnessMode: brightnessMode == freezed
          ? _value.brightnessMode
          : brightnessMode // ignore: cast_nullable_to_non_nullable
              as BrightnessModeEnum,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformsEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Settings implements _Settings {
  _$_Settings(
      {required this.darkTheme,
      required this.lightTheme,
      required this.brightnessMode,
      required this.platform});

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsFromJson(json);

  @override
  final ThemeSet darkTheme;
  @override
  final ThemeSet lightTheme;
  @override
  final BrightnessModeEnum brightnessMode;
  @override
  final PlatformsEnum platform;

  @override
  String toString() {
    return 'Settings(darkTheme: $darkTheme, lightTheme: $lightTheme, brightnessMode: $brightnessMode, platform: $platform)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Settings &&
            (identical(other.darkTheme, darkTheme) ||
                const DeepCollectionEquality()
                    .equals(other.darkTheme, darkTheme)) &&
            (identical(other.lightTheme, lightTheme) ||
                const DeepCollectionEquality()
                    .equals(other.lightTheme, lightTheme)) &&
            (identical(other.brightnessMode, brightnessMode) ||
                const DeepCollectionEquality()
                    .equals(other.brightnessMode, brightnessMode)) &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(darkTheme) ^
      const DeepCollectionEquality().hash(lightTheme) ^
      const DeepCollectionEquality().hash(brightnessMode) ^
      const DeepCollectionEquality().hash(platform);

  @JsonKey(ignore: true)
  @override
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsToJson(this);
  }
}

abstract class _Settings implements Settings {
  factory _Settings(
      {required ThemeSet darkTheme,
      required ThemeSet lightTheme,
      required BrightnessModeEnum brightnessMode,
      required PlatformsEnum platform}) = _$_Settings;

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override
  ThemeSet get darkTheme => throw _privateConstructorUsedError;
  @override
  ThemeSet get lightTheme => throw _privateConstructorUsedError;
  @override
  BrightnessModeEnum get brightnessMode => throw _privateConstructorUsedError;
  @override
  PlatformsEnum get platform => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingsCopyWith<_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
