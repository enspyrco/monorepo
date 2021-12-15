// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_auth_v_m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmailAuthVM _$EmailAuthVMFromJson(Map<String, dynamic> json) {
  return _EmailAuthVM.fromJson(json);
}

/// @nodoc
class _$EmailAuthVMTearOff {
  const _$EmailAuthVMTearOff();

  _EmailAuthVM call({String? email, ISet<ProvidersEnum>? providers}) {
    return _EmailAuthVM(
      email: email,
      providers: providers,
    );
  }

  EmailAuthVM fromJson(Map<String, Object?> json) {
    return EmailAuthVM.fromJson(json);
  }
}

/// @nodoc
const $EmailAuthVM = _$EmailAuthVMTearOff();

/// @nodoc
mixin _$EmailAuthVM {
  String? get email => throw _privateConstructorUsedError;
  ISet<ProvidersEnum>? get providers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailAuthVMCopyWith<EmailAuthVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailAuthVMCopyWith<$Res> {
  factory $EmailAuthVMCopyWith(
          EmailAuthVM value, $Res Function(EmailAuthVM) then) =
      _$EmailAuthVMCopyWithImpl<$Res>;
  $Res call({String? email, ISet<ProvidersEnum>? providers});
}

/// @nodoc
class _$EmailAuthVMCopyWithImpl<$Res> implements $EmailAuthVMCopyWith<$Res> {
  _$EmailAuthVMCopyWithImpl(this._value, this._then);

  final EmailAuthVM _value;
  // ignore: unused_field
  final $Res Function(EmailAuthVM) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? providers = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      providers: providers == freezed
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as ISet<ProvidersEnum>?,
    ));
  }
}

/// @nodoc
abstract class _$EmailAuthVMCopyWith<$Res>
    implements $EmailAuthVMCopyWith<$Res> {
  factory _$EmailAuthVMCopyWith(
          _EmailAuthVM value, $Res Function(_EmailAuthVM) then) =
      __$EmailAuthVMCopyWithImpl<$Res>;
  @override
  $Res call({String? email, ISet<ProvidersEnum>? providers});
}

/// @nodoc
class __$EmailAuthVMCopyWithImpl<$Res> extends _$EmailAuthVMCopyWithImpl<$Res>
    implements _$EmailAuthVMCopyWith<$Res> {
  __$EmailAuthVMCopyWithImpl(
      _EmailAuthVM _value, $Res Function(_EmailAuthVM) _then)
      : super(_value, (v) => _then(v as _EmailAuthVM));

  @override
  _EmailAuthVM get _value => super._value as _EmailAuthVM;

  @override
  $Res call({
    Object? email = freezed,
    Object? providers = freezed,
  }) {
    return _then(_EmailAuthVM(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      providers: providers == freezed
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as ISet<ProvidersEnum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmailAuthVM extends _EmailAuthVM {
  _$_EmailAuthVM({this.email, this.providers}) : super._();

  factory _$_EmailAuthVM.fromJson(Map<String, dynamic> json) =>
      _$$_EmailAuthVMFromJson(json);

  @override
  final String? email;
  @override
  final ISet<ProvidersEnum>? providers;

  @override
  String toString() {
    return 'EmailAuthVM(email: $email, providers: $providers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailAuthVM &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.providers, providers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(providers));

  @JsonKey(ignore: true)
  @override
  _$EmailAuthVMCopyWith<_EmailAuthVM> get copyWith =>
      __$EmailAuthVMCopyWithImpl<_EmailAuthVM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmailAuthVMToJson(this);
  }
}

abstract class _EmailAuthVM extends EmailAuthVM {
  factory _EmailAuthVM({String? email, ISet<ProvidersEnum>? providers}) =
      _$_EmailAuthVM;
  _EmailAuthVM._() : super._();

  factory _EmailAuthVM.fromJson(Map<String, dynamic> json) =
      _$_EmailAuthVM.fromJson;

  @override
  String? get email;
  @override
  ISet<ProvidersEnum>? get providers;
  @override
  @JsonKey(ignore: true)
  _$EmailAuthVMCopyWith<_EmailAuthVM> get copyWith =>
      throw _privateConstructorUsedError;
}
