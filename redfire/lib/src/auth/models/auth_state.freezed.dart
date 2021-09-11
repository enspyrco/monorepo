// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return _AuthState.fromJson(json);
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call(
      {String? email,
      List<String>? signInMethodsForEmail,
      AuthUserData? userData,
      required AuthenticationEnum step}) {
    return _AuthState(
      email: email,
      signInMethodsForEmail: signInMethodsForEmail,
      userData: userData,
      step: step,
    );
  }

  AuthState fromJson(Map<String, Object> json) {
    return AuthState.fromJson(json);
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  String? get email => throw _privateConstructorUsedError;
  List<String>? get signInMethodsForEmail => throw _privateConstructorUsedError;
  AuthUserData? get userData => throw _privateConstructorUsedError;
  AuthenticationEnum get step => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {String? email,
      List<String>? signInMethodsForEmail,
      AuthUserData? userData,
      AuthenticationEnum step});

  $AuthUserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? signInMethodsForEmail = freezed,
    Object? userData = freezed,
    Object? step = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      signInMethodsForEmail: signInMethodsForEmail == freezed
          ? _value.signInMethodsForEmail
          : signInMethodsForEmail // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AuthenticationEnum,
    ));
  }

  @override
  $AuthUserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $AuthUserDataCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value));
    });
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? email,
      List<String>? signInMethodsForEmail,
      AuthUserData? userData,
      AuthenticationEnum step});

  @override
  $AuthUserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? email = freezed,
    Object? signInMethodsForEmail = freezed,
    Object? userData = freezed,
    Object? step = freezed,
  }) {
    return _then(_AuthState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      signInMethodsForEmail: signInMethodsForEmail == freezed
          ? _value.signInMethodsForEmail
          : signInMethodsForEmail // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AuthenticationEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthState implements _AuthState {
  _$_AuthState(
      {this.email,
      this.signInMethodsForEmail,
      this.userData,
      required this.step});

  factory _$_AuthState.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateFromJson(json);

  @override
  final String? email;
  @override
  final List<String>? signInMethodsForEmail;
  @override
  final AuthUserData? userData;
  @override
  final AuthenticationEnum step;

  @override
  String toString() {
    return 'AuthState(email: $email, signInMethodsForEmail: $signInMethodsForEmail, userData: $userData, step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.signInMethodsForEmail, signInMethodsForEmail) ||
                const DeepCollectionEquality().equals(
                    other.signInMethodsForEmail, signInMethodsForEmail)) &&
            (identical(other.userData, userData) ||
                const DeepCollectionEquality()
                    .equals(other.userData, userData)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(signInMethodsForEmail) ^
      const DeepCollectionEquality().hash(userData) ^
      const DeepCollectionEquality().hash(step);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateToJson(this);
  }
}

abstract class _AuthState implements AuthState {
  factory _AuthState(
      {String? email,
      List<String>? signInMethodsForEmail,
      AuthUserData? userData,
      required AuthenticationEnum step}) = _$_AuthState;

  factory _AuthState.fromJson(Map<String, dynamic> json) =
      _$_AuthState.fromJson;

  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  List<String>? get signInMethodsForEmail => throw _privateConstructorUsedError;
  @override
  AuthUserData? get userData => throw _privateConstructorUsedError;
  @override
  AuthenticationEnum get step => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
