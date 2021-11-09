// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_theme_mode_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetThemeModeAction _$SetThemeModeActionFromJson(Map<String, dynamic> json) {
  return _SetThemeModeAction.fromJson(json);
}

/// @nodoc
class _$SetThemeModeActionTearOff {
  const _$SetThemeModeActionTearOff();

  _SetThemeModeAction call(int themeMode) {
    return _SetThemeModeAction(
      themeMode,
    );
  }

  SetThemeModeAction fromJson(Map<String, Object?> json) {
    return SetThemeModeAction.fromJson(json);
  }
}

/// @nodoc
const $SetThemeModeAction = _$SetThemeModeActionTearOff();

/// @nodoc
mixin _$SetThemeModeAction {
  int get themeMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetThemeModeActionCopyWith<SetThemeModeAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetThemeModeActionCopyWith<$Res> {
  factory $SetThemeModeActionCopyWith(
          SetThemeModeAction value, $Res Function(SetThemeModeAction) then) =
      _$SetThemeModeActionCopyWithImpl<$Res>;
  $Res call({int themeMode});
}

/// @nodoc
class _$SetThemeModeActionCopyWithImpl<$Res>
    implements $SetThemeModeActionCopyWith<$Res> {
  _$SetThemeModeActionCopyWithImpl(this._value, this._then);

  final SetThemeModeAction _value;
  // ignore: unused_field
  final $Res Function(SetThemeModeAction) _then;

  @override
  $Res call({
    Object? themeMode = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SetThemeModeActionCopyWith<$Res>
    implements $SetThemeModeActionCopyWith<$Res> {
  factory _$SetThemeModeActionCopyWith(
          _SetThemeModeAction value, $Res Function(_SetThemeModeAction) then) =
      __$SetThemeModeActionCopyWithImpl<$Res>;
  @override
  $Res call({int themeMode});
}

/// @nodoc
class __$SetThemeModeActionCopyWithImpl<$Res>
    extends _$SetThemeModeActionCopyWithImpl<$Res>
    implements _$SetThemeModeActionCopyWith<$Res> {
  __$SetThemeModeActionCopyWithImpl(
      _SetThemeModeAction _value, $Res Function(_SetThemeModeAction) _then)
      : super(_value, (v) => _then(v as _SetThemeModeAction));

  @override
  _SetThemeModeAction get _value => super._value as _SetThemeModeAction;

  @override
  $Res call({
    Object? themeMode = freezed,
  }) {
    return _then(_SetThemeModeAction(
      themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetThemeModeAction implements _SetThemeModeAction {
  _$_SetThemeModeAction(this.themeMode);

  factory _$_SetThemeModeAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetThemeModeActionFromJson(json);

  @override
  final int themeMode;

  @override
  String toString() {
    return 'SetThemeModeAction(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetThemeModeAction &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  _$SetThemeModeActionCopyWith<_SetThemeModeAction> get copyWith =>
      __$SetThemeModeActionCopyWithImpl<_SetThemeModeAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetThemeModeActionToJson(this);
  }
}

abstract class _SetThemeModeAction implements SetThemeModeAction {
  factory _SetThemeModeAction(int themeMode) = _$_SetThemeModeAction;

  factory _SetThemeModeAction.fromJson(Map<String, dynamic> json) =
      _$_SetThemeModeAction.fromJson;

  @override
  int get themeMode;
  @override
  @JsonKey(ignore: true)
  _$SetThemeModeActionCopyWith<_SetThemeModeAction> get copyWith =>
      throw _privateConstructorUsedError;
}
