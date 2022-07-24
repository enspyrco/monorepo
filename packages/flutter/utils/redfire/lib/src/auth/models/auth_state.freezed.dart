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
      {required EmailAuthVM emailVM,
      AuthUserData? userData,
      IdTokenResult? idTokenResult,
      required LinkAccountsViewModel linking,
      required AuthStepEnum step}) {
    return _AuthState(
      emailVM: emailVM,
      userData: userData,
      idTokenResult: idTokenResult,
      linking: linking,
      step: step,
    );
  }

  AuthState fromJson(Map<String, Object?> json) {
    return AuthState.fromJson(json);
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  EmailAuthVM get emailVM => throw _privateConstructorUsedError;
  AuthUserData? get userData => throw _privateConstructorUsedError;
  IdTokenResult? get idTokenResult => throw _privateConstructorUsedError;
  LinkAccountsViewModel get linking => throw _privateConstructorUsedError;
  AuthStepEnum get step => throw _privateConstructorUsedError;

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
      {EmailAuthVM emailVM,
      AuthUserData? userData,
      IdTokenResult? idTokenResult,
      LinkAccountsViewModel linking,
      AuthStepEnum step});

  $EmailAuthVMCopyWith<$Res> get emailVM;
  $AuthUserDataCopyWith<$Res>? get userData;
  $IdTokenResultCopyWith<$Res>? get idTokenResult;
  $LinkAccountsViewModelCopyWith<$Res> get linking;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? emailVM = freezed,
    Object? userData = freezed,
    Object? idTokenResult = freezed,
    Object? linking = freezed,
    Object? step = freezed,
  }) {
    return _then(_value.copyWith(
      emailVM: emailVM == freezed
          ? _value.emailVM
          : emailVM // ignore: cast_nullable_to_non_nullable
              as EmailAuthVM,
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
      idTokenResult: idTokenResult == freezed
          ? _value.idTokenResult
          : idTokenResult // ignore: cast_nullable_to_non_nullable
              as IdTokenResult?,
      linking: linking == freezed
          ? _value.linking
          : linking // ignore: cast_nullable_to_non_nullable
              as LinkAccountsViewModel,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AuthStepEnum,
    ));
  }

  @override
  $EmailAuthVMCopyWith<$Res> get emailVM {
    return $EmailAuthVMCopyWith<$Res>(_value.emailVM, (value) {
      return _then(_value.copyWith(emailVM: value));
    });
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

  @override
  $IdTokenResultCopyWith<$Res>? get idTokenResult {
    if (_value.idTokenResult == null) {
      return null;
    }

    return $IdTokenResultCopyWith<$Res>(_value.idTokenResult!, (value) {
      return _then(_value.copyWith(idTokenResult: value));
    });
  }

  @override
  $LinkAccountsViewModelCopyWith<$Res> get linking {
    return $LinkAccountsViewModelCopyWith<$Res>(_value.linking, (value) {
      return _then(_value.copyWith(linking: value));
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
      {EmailAuthVM emailVM,
      AuthUserData? userData,
      IdTokenResult? idTokenResult,
      LinkAccountsViewModel linking,
      AuthStepEnum step});

  @override
  $EmailAuthVMCopyWith<$Res> get emailVM;
  @override
  $AuthUserDataCopyWith<$Res>? get userData;
  @override
  $IdTokenResultCopyWith<$Res>? get idTokenResult;
  @override
  $LinkAccountsViewModelCopyWith<$Res> get linking;
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
    Object? emailVM = freezed,
    Object? userData = freezed,
    Object? idTokenResult = freezed,
    Object? linking = freezed,
    Object? step = freezed,
  }) {
    return _then(_AuthState(
      emailVM: emailVM == freezed
          ? _value.emailVM
          : emailVM // ignore: cast_nullable_to_non_nullable
              as EmailAuthVM,
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
      idTokenResult: idTokenResult == freezed
          ? _value.idTokenResult
          : idTokenResult // ignore: cast_nullable_to_non_nullable
              as IdTokenResult?,
      linking: linking == freezed
          ? _value.linking
          : linking // ignore: cast_nullable_to_non_nullable
              as LinkAccountsViewModel,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AuthStepEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthState implements _AuthState {
  _$_AuthState(
      {required this.emailVM,
      this.userData,
      this.idTokenResult,
      required this.linking,
      required this.step});

  factory _$_AuthState.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateFromJson(json);

  @override
  final EmailAuthVM emailVM;
  @override
  final AuthUserData? userData;
  @override
  final IdTokenResult? idTokenResult;
  @override
  final LinkAccountsViewModel linking;
  @override
  final AuthStepEnum step;

  @override
  String toString() {
    return 'AuthState(emailVM: $emailVM, userData: $userData, idTokenResult: $idTokenResult, linking: $linking, step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            const DeepCollectionEquality().equals(other.emailVM, emailVM) &&
            const DeepCollectionEquality().equals(other.userData, userData) &&
            const DeepCollectionEquality()
                .equals(other.idTokenResult, idTokenResult) &&
            const DeepCollectionEquality().equals(other.linking, linking) &&
            const DeepCollectionEquality().equals(other.step, step));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailVM),
      const DeepCollectionEquality().hash(userData),
      const DeepCollectionEquality().hash(idTokenResult),
      const DeepCollectionEquality().hash(linking),
      const DeepCollectionEquality().hash(step));

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
      {required EmailAuthVM emailVM,
      AuthUserData? userData,
      IdTokenResult? idTokenResult,
      required LinkAccountsViewModel linking,
      required AuthStepEnum step}) = _$_AuthState;

  factory _AuthState.fromJson(Map<String, dynamic> json) =
      _$_AuthState.fromJson;

  @override
  EmailAuthVM get emailVM;
  @override
  AuthUserData? get userData;
  @override
  IdTokenResult? get idTokenResult;
  @override
  LinkAccountsViewModel get linking;
  @override
  AuthStepEnum get step;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
