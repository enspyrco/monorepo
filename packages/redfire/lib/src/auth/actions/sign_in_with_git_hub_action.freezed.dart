// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_with_git_hub_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInWithGitHubAction _$SignInWithGitHubActionFromJson(
    Map<String, dynamic> json) {
  return _SignInWithGitHubAction.fromJson(json);
}

/// @nodoc
class _$SignInWithGitHubActionTearOff {
  const _$SignInWithGitHubActionTearOff();

  _SignInWithGitHubAction call() {
    return const _SignInWithGitHubAction();
  }

  SignInWithGitHubAction fromJson(Map<String, Object?> json) {
    return SignInWithGitHubAction.fromJson(json);
  }
}

/// @nodoc
const $SignInWithGitHubAction = _$SignInWithGitHubActionTearOff();

/// @nodoc
mixin _$SignInWithGitHubAction {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithGitHubActionCopyWith<$Res> {
  factory $SignInWithGitHubActionCopyWith(SignInWithGitHubAction value,
          $Res Function(SignInWithGitHubAction) then) =
      _$SignInWithGitHubActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithGitHubActionCopyWithImpl<$Res>
    implements $SignInWithGitHubActionCopyWith<$Res> {
  _$SignInWithGitHubActionCopyWithImpl(this._value, this._then);

  final SignInWithGitHubAction _value;
  // ignore: unused_field
  final $Res Function(SignInWithGitHubAction) _then;
}

/// @nodoc
abstract class _$SignInWithGitHubActionCopyWith<$Res> {
  factory _$SignInWithGitHubActionCopyWith(_SignInWithGitHubAction value,
          $Res Function(_SignInWithGitHubAction) then) =
      __$SignInWithGitHubActionCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInWithGitHubActionCopyWithImpl<$Res>
    extends _$SignInWithGitHubActionCopyWithImpl<$Res>
    implements _$SignInWithGitHubActionCopyWith<$Res> {
  __$SignInWithGitHubActionCopyWithImpl(_SignInWithGitHubAction _value,
      $Res Function(_SignInWithGitHubAction) _then)
      : super(_value, (v) => _then(v as _SignInWithGitHubAction));

  @override
  _SignInWithGitHubAction get _value => super._value as _SignInWithGitHubAction;
}

/// @nodoc
@JsonSerializable()
class _$_SignInWithGitHubAction implements _SignInWithGitHubAction {
  const _$_SignInWithGitHubAction();

  factory _$_SignInWithGitHubAction.fromJson(Map<String, dynamic> json) =>
      _$$_SignInWithGitHubActionFromJson(json);

  @override
  String toString() {
    return 'SignInWithGitHubAction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInWithGitHubAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInWithGitHubActionToJson(this);
  }
}

abstract class _SignInWithGitHubAction implements SignInWithGitHubAction {
  const factory _SignInWithGitHubAction() = _$_SignInWithGitHubAction;

  factory _SignInWithGitHubAction.fromJson(Map<String, dynamic> json) =
      _$_SignInWithGitHubAction.fromJson;
}
