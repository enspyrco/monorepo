// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_with_google_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInWithGoogleAction _$SignInWithGoogleActionFromJson(
    Map<String, dynamic> json) {
  return _SignInWithGoogleAction.fromJson(json);
}

/// @nodoc
class _$SignInWithGoogleActionTearOff {
  const _$SignInWithGoogleActionTearOff();

  _SignInWithGoogleAction call() {
    return _SignInWithGoogleAction();
  }

  SignInWithGoogleAction fromJson(Map<String, Object?> json) {
    return SignInWithGoogleAction.fromJson(json);
  }
}

/// @nodoc
const $SignInWithGoogleAction = _$SignInWithGoogleActionTearOff();

/// @nodoc
mixin _$SignInWithGoogleAction {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithGoogleActionCopyWith<$Res> {
  factory $SignInWithGoogleActionCopyWith(SignInWithGoogleAction value,
          $Res Function(SignInWithGoogleAction) then) =
      _$SignInWithGoogleActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithGoogleActionCopyWithImpl<$Res>
    implements $SignInWithGoogleActionCopyWith<$Res> {
  _$SignInWithGoogleActionCopyWithImpl(this._value, this._then);

  final SignInWithGoogleAction _value;
  // ignore: unused_field
  final $Res Function(SignInWithGoogleAction) _then;
}

/// @nodoc
abstract class _$SignInWithGoogleActionCopyWith<$Res> {
  factory _$SignInWithGoogleActionCopyWith(_SignInWithGoogleAction value,
          $Res Function(_SignInWithGoogleAction) then) =
      __$SignInWithGoogleActionCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInWithGoogleActionCopyWithImpl<$Res>
    extends _$SignInWithGoogleActionCopyWithImpl<$Res>
    implements _$SignInWithGoogleActionCopyWith<$Res> {
  __$SignInWithGoogleActionCopyWithImpl(_SignInWithGoogleAction _value,
      $Res Function(_SignInWithGoogleAction) _then)
      : super(_value, (v) => _then(v as _SignInWithGoogleAction));

  @override
  _SignInWithGoogleAction get _value => super._value as _SignInWithGoogleAction;
}

/// @nodoc
@JsonSerializable()
class _$_SignInWithGoogleAction extends _SignInWithGoogleAction {
  _$_SignInWithGoogleAction() : super._();

  factory _$_SignInWithGoogleAction.fromJson(Map<String, dynamic> json) =>
      _$$_SignInWithGoogleActionFromJson(json);

  @override
  String toString() {
    return 'SignInWithGoogleAction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInWithGoogleAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInWithGoogleActionToJson(this);
  }
}

abstract class _SignInWithGoogleAction extends SignInWithGoogleAction {
  factory _SignInWithGoogleAction() = _$_SignInWithGoogleAction;
  _SignInWithGoogleAction._() : super._();

  factory _SignInWithGoogleAction.fromJson(Map<String, dynamic> json) =
      _$_SignInWithGoogleAction.fromJson;
}
