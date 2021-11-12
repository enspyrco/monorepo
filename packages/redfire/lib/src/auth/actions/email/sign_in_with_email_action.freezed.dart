// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_with_email_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInWithEmailAction _$SignInWithEmailActionFromJson(
    Map<String, dynamic> json) {
  return _SignInWithEmailAction.fromJson(json);
}

/// @nodoc
class _$SignInWithEmailActionTearOff {
  const _$SignInWithEmailActionTearOff();

  _SignInWithEmailAction call(String password) {
    return _SignInWithEmailAction(
      password,
    );
  }

  SignInWithEmailAction fromJson(Map<String, Object?> json) {
    return SignInWithEmailAction.fromJson(json);
  }
}

/// @nodoc
const $SignInWithEmailAction = _$SignInWithEmailActionTearOff();

/// @nodoc
mixin _$SignInWithEmailAction {
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInWithEmailActionCopyWith<SignInWithEmailAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithEmailActionCopyWith<$Res> {
  factory $SignInWithEmailActionCopyWith(SignInWithEmailAction value,
          $Res Function(SignInWithEmailAction) then) =
      _$SignInWithEmailActionCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$SignInWithEmailActionCopyWithImpl<$Res>
    implements $SignInWithEmailActionCopyWith<$Res> {
  _$SignInWithEmailActionCopyWithImpl(this._value, this._then);

  final SignInWithEmailAction _value;
  // ignore: unused_field
  final $Res Function(SignInWithEmailAction) _then;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignInWithEmailActionCopyWith<$Res>
    implements $SignInWithEmailActionCopyWith<$Res> {
  factory _$SignInWithEmailActionCopyWith(_SignInWithEmailAction value,
          $Res Function(_SignInWithEmailAction) then) =
      __$SignInWithEmailActionCopyWithImpl<$Res>;
  @override
  $Res call({String password});
}

/// @nodoc
class __$SignInWithEmailActionCopyWithImpl<$Res>
    extends _$SignInWithEmailActionCopyWithImpl<$Res>
    implements _$SignInWithEmailActionCopyWith<$Res> {
  __$SignInWithEmailActionCopyWithImpl(_SignInWithEmailAction _value,
      $Res Function(_SignInWithEmailAction) _then)
      : super(_value, (v) => _then(v as _SignInWithEmailAction));

  @override
  _SignInWithEmailAction get _value => super._value as _SignInWithEmailAction;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_SignInWithEmailAction(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInWithEmailAction extends _SignInWithEmailAction {
  _$_SignInWithEmailAction(this.password) : super._();

  factory _$_SignInWithEmailAction.fromJson(Map<String, dynamic> json) =>
      _$$_SignInWithEmailActionFromJson(json);

  @override
  final String password;

  @override
  String toString() {
    return 'SignInWithEmailAction(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInWithEmailAction &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  _$SignInWithEmailActionCopyWith<_SignInWithEmailAction> get copyWith =>
      __$SignInWithEmailActionCopyWithImpl<_SignInWithEmailAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInWithEmailActionToJson(this);
  }
}

abstract class _SignInWithEmailAction extends SignInWithEmailAction {
  factory _SignInWithEmailAction(String password) = _$_SignInWithEmailAction;
  _SignInWithEmailAction._() : super._();

  factory _SignInWithEmailAction.fromJson(Map<String, dynamic> json) =
      _$_SignInWithEmailAction.fromJson;

  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$SignInWithEmailActionCopyWith<_SignInWithEmailAction> get copyWith =>
      throw _privateConstructorUsedError;
}
