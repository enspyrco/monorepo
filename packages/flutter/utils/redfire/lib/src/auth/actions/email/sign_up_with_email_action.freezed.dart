// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_with_email_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpWithEmailAction _$SignUpWithEmailActionFromJson(
    Map<String, dynamic> json) {
  return _SignUpWithEmailAction.fromJson(json);
}

/// @nodoc
class _$SignUpWithEmailActionTearOff {
  const _$SignUpWithEmailActionTearOff();

  _SignUpWithEmailAction call(String password) {
    return _SignUpWithEmailAction(
      password,
    );
  }

  SignUpWithEmailAction fromJson(Map<String, Object?> json) {
    return SignUpWithEmailAction.fromJson(json);
  }
}

/// @nodoc
const $SignUpWithEmailAction = _$SignUpWithEmailActionTearOff();

/// @nodoc
mixin _$SignUpWithEmailAction {
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpWithEmailActionCopyWith<SignUpWithEmailAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpWithEmailActionCopyWith<$Res> {
  factory $SignUpWithEmailActionCopyWith(SignUpWithEmailAction value,
          $Res Function(SignUpWithEmailAction) then) =
      _$SignUpWithEmailActionCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$SignUpWithEmailActionCopyWithImpl<$Res>
    implements $SignUpWithEmailActionCopyWith<$Res> {
  _$SignUpWithEmailActionCopyWithImpl(this._value, this._then);

  final SignUpWithEmailAction _value;
  // ignore: unused_field
  final $Res Function(SignUpWithEmailAction) _then;

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
abstract class _$SignUpWithEmailActionCopyWith<$Res>
    implements $SignUpWithEmailActionCopyWith<$Res> {
  factory _$SignUpWithEmailActionCopyWith(_SignUpWithEmailAction value,
          $Res Function(_SignUpWithEmailAction) then) =
      __$SignUpWithEmailActionCopyWithImpl<$Res>;
  @override
  $Res call({String password});
}

/// @nodoc
class __$SignUpWithEmailActionCopyWithImpl<$Res>
    extends _$SignUpWithEmailActionCopyWithImpl<$Res>
    implements _$SignUpWithEmailActionCopyWith<$Res> {
  __$SignUpWithEmailActionCopyWithImpl(_SignUpWithEmailAction _value,
      $Res Function(_SignUpWithEmailAction) _then)
      : super(_value, (v) => _then(v as _SignUpWithEmailAction));

  @override
  _SignUpWithEmailAction get _value => super._value as _SignUpWithEmailAction;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_SignUpWithEmailAction(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpWithEmailAction extends _SignUpWithEmailAction {
  const _$_SignUpWithEmailAction(this.password) : super._();

  factory _$_SignUpWithEmailAction.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpWithEmailActionFromJson(json);

  @override
  final String password;

  @override
  String toString() {
    return 'SignUpWithEmailAction(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpWithEmailAction &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$SignUpWithEmailActionCopyWith<_SignUpWithEmailAction> get copyWith =>
      __$SignUpWithEmailActionCopyWithImpl<_SignUpWithEmailAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpWithEmailActionToJson(this);
  }
}

abstract class _SignUpWithEmailAction extends SignUpWithEmailAction {
  const factory _SignUpWithEmailAction(String password) =
      _$_SignUpWithEmailAction;
  const _SignUpWithEmailAction._() : super._();

  factory _SignUpWithEmailAction.fromJson(Map<String, dynamic> json) =
      _$_SignUpWithEmailAction.fromJson;

  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$SignUpWithEmailActionCopyWith<_SignUpWithEmailAction> get copyWith =>
      throw _privateConstructorUsedError;
}
