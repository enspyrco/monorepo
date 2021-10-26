// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tap_profile_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TapProfileAction _$TapProfileActionFromJson(Map<String, dynamic> json) {
  return _TapProfileAction.fromJson(json);
}

/// @nodoc
class _$TapProfileActionTearOff {
  const _$TapProfileActionTearOff();

  _TapProfileAction call({bool turnOff = false}) {
    return _TapProfileAction(
      turnOff: turnOff,
    );
  }

  TapProfileAction fromJson(Map<String, Object?> json) {
    return TapProfileAction.fromJson(json);
  }
}

/// @nodoc
const $TapProfileAction = _$TapProfileActionTearOff();

/// @nodoc
mixin _$TapProfileAction {
  bool get turnOff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TapProfileActionCopyWith<TapProfileAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TapProfileActionCopyWith<$Res> {
  factory $TapProfileActionCopyWith(
          TapProfileAction value, $Res Function(TapProfileAction) then) =
      _$TapProfileActionCopyWithImpl<$Res>;
  $Res call({bool turnOff});
}

/// @nodoc
class _$TapProfileActionCopyWithImpl<$Res>
    implements $TapProfileActionCopyWith<$Res> {
  _$TapProfileActionCopyWithImpl(this._value, this._then);

  final TapProfileAction _value;
  // ignore: unused_field
  final $Res Function(TapProfileAction) _then;

  @override
  $Res call({
    Object? turnOff = freezed,
  }) {
    return _then(_value.copyWith(
      turnOff: turnOff == freezed
          ? _value.turnOff
          : turnOff // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TapProfileActionCopyWith<$Res>
    implements $TapProfileActionCopyWith<$Res> {
  factory _$TapProfileActionCopyWith(
          _TapProfileAction value, $Res Function(_TapProfileAction) then) =
      __$TapProfileActionCopyWithImpl<$Res>;
  @override
  $Res call({bool turnOff});
}

/// @nodoc
class __$TapProfileActionCopyWithImpl<$Res>
    extends _$TapProfileActionCopyWithImpl<$Res>
    implements _$TapProfileActionCopyWith<$Res> {
  __$TapProfileActionCopyWithImpl(
      _TapProfileAction _value, $Res Function(_TapProfileAction) _then)
      : super(_value, (v) => _then(v as _TapProfileAction));

  @override
  _TapProfileAction get _value => super._value as _TapProfileAction;

  @override
  $Res call({
    Object? turnOff = freezed,
  }) {
    return _then(_TapProfileAction(
      turnOff: turnOff == freezed
          ? _value.turnOff
          : turnOff // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TapProfileAction implements _TapProfileAction {
  _$_TapProfileAction({this.turnOff = false});

  factory _$_TapProfileAction.fromJson(Map<String, dynamic> json) =>
      _$$_TapProfileActionFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool turnOff;

  @override
  String toString() {
    return 'TapProfileAction(turnOff: $turnOff)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TapProfileAction &&
            (identical(other.turnOff, turnOff) || other.turnOff == turnOff));
  }

  @override
  int get hashCode => Object.hash(runtimeType, turnOff);

  @JsonKey(ignore: true)
  @override
  _$TapProfileActionCopyWith<_TapProfileAction> get copyWith =>
      __$TapProfileActionCopyWithImpl<_TapProfileAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TapProfileActionToJson(this);
  }
}

abstract class _TapProfileAction implements TapProfileAction {
  factory _TapProfileAction({bool turnOff}) = _$_TapProfileAction;

  factory _TapProfileAction.fromJson(Map<String, dynamic> json) =
      _$_TapProfileAction.fromJson;

  @override
  bool get turnOff;
  @override
  @JsonKey(ignore: true)
  _$TapProfileActionCopyWith<_TapProfileAction> get copyWith =>
      throw _privateConstructorUsedError;
}
