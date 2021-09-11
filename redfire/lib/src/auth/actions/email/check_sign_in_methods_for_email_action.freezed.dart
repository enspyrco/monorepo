// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'check_sign_in_methods_for_email_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckSignInMethodsForEmailAction _$CheckSignInMethodsForEmailActionFromJson(
    Map<String, dynamic> json) {
  return _CheckSignInMethodsForEmailAction.fromJson(json);
}

/// @nodoc
class _$CheckSignInMethodsForEmailActionTearOff {
  const _$CheckSignInMethodsForEmailActionTearOff();

  _CheckSignInMethodsForEmailAction call(String email) {
    return _CheckSignInMethodsForEmailAction(
      email,
    );
  }

  CheckSignInMethodsForEmailAction fromJson(Map<String, Object> json) {
    return CheckSignInMethodsForEmailAction.fromJson(json);
  }
}

/// @nodoc
const $CheckSignInMethodsForEmailAction =
    _$CheckSignInMethodsForEmailActionTearOff();

/// @nodoc
mixin _$CheckSignInMethodsForEmailAction {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckSignInMethodsForEmailActionCopyWith<CheckSignInMethodsForEmailAction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckSignInMethodsForEmailActionCopyWith<$Res> {
  factory $CheckSignInMethodsForEmailActionCopyWith(
          CheckSignInMethodsForEmailAction value,
          $Res Function(CheckSignInMethodsForEmailAction) then) =
      _$CheckSignInMethodsForEmailActionCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$CheckSignInMethodsForEmailActionCopyWithImpl<$Res>
    implements $CheckSignInMethodsForEmailActionCopyWith<$Res> {
  _$CheckSignInMethodsForEmailActionCopyWithImpl(this._value, this._then);

  final CheckSignInMethodsForEmailAction _value;
  // ignore: unused_field
  final $Res Function(CheckSignInMethodsForEmailAction) _then;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CheckSignInMethodsForEmailActionCopyWith<$Res>
    implements $CheckSignInMethodsForEmailActionCopyWith<$Res> {
  factory _$CheckSignInMethodsForEmailActionCopyWith(
          _CheckSignInMethodsForEmailAction value,
          $Res Function(_CheckSignInMethodsForEmailAction) then) =
      __$CheckSignInMethodsForEmailActionCopyWithImpl<$Res>;
  @override
  $Res call({String email});
}

/// @nodoc
class __$CheckSignInMethodsForEmailActionCopyWithImpl<$Res>
    extends _$CheckSignInMethodsForEmailActionCopyWithImpl<$Res>
    implements _$CheckSignInMethodsForEmailActionCopyWith<$Res> {
  __$CheckSignInMethodsForEmailActionCopyWithImpl(
      _CheckSignInMethodsForEmailAction _value,
      $Res Function(_CheckSignInMethodsForEmailAction) _then)
      : super(_value, (v) => _then(v as _CheckSignInMethodsForEmailAction));

  @override
  _CheckSignInMethodsForEmailAction get _value =>
      super._value as _CheckSignInMethodsForEmailAction;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_CheckSignInMethodsForEmailAction(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckSignInMethodsForEmailAction
    implements _CheckSignInMethodsForEmailAction {
  _$_CheckSignInMethodsForEmailAction(this.email);

  factory _$_CheckSignInMethodsForEmailAction.fromJson(
          Map<String, dynamic> json) =>
      _$$_CheckSignInMethodsForEmailActionFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'CheckSignInMethodsForEmailAction(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CheckSignInMethodsForEmailAction &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$CheckSignInMethodsForEmailActionCopyWith<_CheckSignInMethodsForEmailAction>
      get copyWith => __$CheckSignInMethodsForEmailActionCopyWithImpl<
          _CheckSignInMethodsForEmailAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckSignInMethodsForEmailActionToJson(this);
  }
}

abstract class _CheckSignInMethodsForEmailAction
    implements CheckSignInMethodsForEmailAction {
  factory _CheckSignInMethodsForEmailAction(String email) =
      _$_CheckSignInMethodsForEmailAction;

  factory _CheckSignInMethodsForEmailAction.fromJson(
      Map<String, dynamic> json) = _$_CheckSignInMethodsForEmailAction.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CheckSignInMethodsForEmailActionCopyWith<_CheckSignInMethodsForEmailAction>
      get copyWith => throw _privateConstructorUsedError;
}
