// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_out_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignOutAction _$SignOutActionFromJson(Map<String, dynamic> json) {
  return _SignOutAction.fromJson(json);
}

/// @nodoc
class _$SignOutActionTearOff {
  const _$SignOutActionTearOff();

  _SignOutAction call() {
    return const _SignOutAction();
  }

  SignOutAction fromJson(Map<String, Object?> json) {
    return SignOutAction.fromJson(json);
  }
}

/// @nodoc
const $SignOutAction = _$SignOutActionTearOff();

/// @nodoc
mixin _$SignOutAction {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignOutActionCopyWith<$Res> {
  factory $SignOutActionCopyWith(
          SignOutAction value, $Res Function(SignOutAction) then) =
      _$SignOutActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignOutActionCopyWithImpl<$Res>
    implements $SignOutActionCopyWith<$Res> {
  _$SignOutActionCopyWithImpl(this._value, this._then);

  final SignOutAction _value;
  // ignore: unused_field
  final $Res Function(SignOutAction) _then;
}

/// @nodoc
abstract class _$SignOutActionCopyWith<$Res> {
  factory _$SignOutActionCopyWith(
          _SignOutAction value, $Res Function(_SignOutAction) then) =
      __$SignOutActionCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignOutActionCopyWithImpl<$Res>
    extends _$SignOutActionCopyWithImpl<$Res>
    implements _$SignOutActionCopyWith<$Res> {
  __$SignOutActionCopyWithImpl(
      _SignOutAction _value, $Res Function(_SignOutAction) _then)
      : super(_value, (v) => _then(v as _SignOutAction));

  @override
  _SignOutAction get _value => super._value as _SignOutAction;
}

/// @nodoc
@JsonSerializable()
class _$_SignOutAction extends _SignOutAction {
  const _$_SignOutAction() : super._();

  factory _$_SignOutAction.fromJson(Map<String, dynamic> json) =>
      _$$_SignOutActionFromJson(json);

  @override
  String toString() {
    return 'SignOutAction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignOutAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignOutActionToJson(this);
  }
}

abstract class _SignOutAction extends SignOutAction {
  const factory _SignOutAction() = _$_SignOutAction;
  const _SignOutAction._() : super._();

  factory _SignOutAction.fromJson(Map<String, dynamic> json) =
      _$_SignOutAction.fromJson;
}
