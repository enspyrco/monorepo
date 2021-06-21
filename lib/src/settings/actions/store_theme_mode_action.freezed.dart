// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'store_theme_mode_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreThemeModeAction _$StoreThemeModeActionFromJson(Map<String, dynamic> json) {
  return _StoreThemeModeAction.fromJson(json);
}

/// @nodoc
class _$StoreThemeModeActionTearOff {
  const _$StoreThemeModeActionTearOff();

  _StoreThemeModeAction call(int themeMode) {
    return _StoreThemeModeAction(
      themeMode,
    );
  }

  StoreThemeModeAction fromJson(Map<String, Object> json) {
    return StoreThemeModeAction.fromJson(json);
  }
}

/// @nodoc
const $StoreThemeModeAction = _$StoreThemeModeActionTearOff();

/// @nodoc
mixin _$StoreThemeModeAction {
  int get themeMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreThemeModeActionCopyWith<StoreThemeModeAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreThemeModeActionCopyWith<$Res> {
  factory $StoreThemeModeActionCopyWith(StoreThemeModeAction value,
          $Res Function(StoreThemeModeAction) then) =
      _$StoreThemeModeActionCopyWithImpl<$Res>;
  $Res call({int themeMode});
}

/// @nodoc
class _$StoreThemeModeActionCopyWithImpl<$Res>
    implements $StoreThemeModeActionCopyWith<$Res> {
  _$StoreThemeModeActionCopyWithImpl(this._value, this._then);

  final StoreThemeModeAction _value;
  // ignore: unused_field
  final $Res Function(StoreThemeModeAction) _then;

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
abstract class _$StoreThemeModeActionCopyWith<$Res>
    implements $StoreThemeModeActionCopyWith<$Res> {
  factory _$StoreThemeModeActionCopyWith(_StoreThemeModeAction value,
          $Res Function(_StoreThemeModeAction) then) =
      __$StoreThemeModeActionCopyWithImpl<$Res>;
  @override
  $Res call({int themeMode});
}

/// @nodoc
class __$StoreThemeModeActionCopyWithImpl<$Res>
    extends _$StoreThemeModeActionCopyWithImpl<$Res>
    implements _$StoreThemeModeActionCopyWith<$Res> {
  __$StoreThemeModeActionCopyWithImpl(
      _StoreThemeModeAction _value, $Res Function(_StoreThemeModeAction) _then)
      : super(_value, (v) => _then(v as _StoreThemeModeAction));

  @override
  _StoreThemeModeAction get _value => super._value as _StoreThemeModeAction;

  @override
  $Res call({
    Object? themeMode = freezed,
  }) {
    return _then(_StoreThemeModeAction(
      themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreThemeModeAction implements _StoreThemeModeAction {
  _$_StoreThemeModeAction(this.themeMode);

  factory _$_StoreThemeModeAction.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreThemeModeActionFromJson(json);

  @override
  final int themeMode;

  @override
  String toString() {
    return 'StoreThemeModeAction(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreThemeModeAction &&
            (identical(other.themeMode, themeMode) ||
                const DeepCollectionEquality()
                    .equals(other.themeMode, themeMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(themeMode);

  @JsonKey(ignore: true)
  @override
  _$StoreThemeModeActionCopyWith<_StoreThemeModeAction> get copyWith =>
      __$StoreThemeModeActionCopyWithImpl<_StoreThemeModeAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreThemeModeActionToJson(this);
  }
}

abstract class _StoreThemeModeAction implements StoreThemeModeAction {
  factory _StoreThemeModeAction(int themeMode) = _$_StoreThemeModeAction;

  factory _StoreThemeModeAction.fromJson(Map<String, dynamic> json) =
      _$_StoreThemeModeAction.fromJson;

  @override
  int get themeMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreThemeModeActionCopyWith<_StoreThemeModeAction> get copyWith =>
      throw _privateConstructorUsedError;
}
