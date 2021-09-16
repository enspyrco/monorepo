// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_providers_for_email_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetProvidersForEmailAction _$GetProvidersForEmailActionFromJson(
    Map<String, dynamic> json) {
  return _GetProvidersForEmailAction.fromJson(json);
}

/// @nodoc
class _$GetProvidersForEmailActionTearOff {
  const _$GetProvidersForEmailActionTearOff();

  _GetProvidersForEmailAction call(String email) {
    return _GetProvidersForEmailAction(
      email,
    );
  }

  GetProvidersForEmailAction fromJson(Map<String, Object> json) {
    return GetProvidersForEmailAction.fromJson(json);
  }
}

/// @nodoc
const $GetProvidersForEmailAction = _$GetProvidersForEmailActionTearOff();

/// @nodoc
mixin _$GetProvidersForEmailAction {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProvidersForEmailActionCopyWith<GetProvidersForEmailAction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProvidersForEmailActionCopyWith<$Res> {
  factory $GetProvidersForEmailActionCopyWith(GetProvidersForEmailAction value,
          $Res Function(GetProvidersForEmailAction) then) =
      _$GetProvidersForEmailActionCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$GetProvidersForEmailActionCopyWithImpl<$Res>
    implements $GetProvidersForEmailActionCopyWith<$Res> {
  _$GetProvidersForEmailActionCopyWithImpl(this._value, this._then);

  final GetProvidersForEmailAction _value;
  // ignore: unused_field
  final $Res Function(GetProvidersForEmailAction) _then;

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
abstract class _$GetProvidersForEmailActionCopyWith<$Res>
    implements $GetProvidersForEmailActionCopyWith<$Res> {
  factory _$GetProvidersForEmailActionCopyWith(
          _GetProvidersForEmailAction value,
          $Res Function(_GetProvidersForEmailAction) then) =
      __$GetProvidersForEmailActionCopyWithImpl<$Res>;
  @override
  $Res call({String email});
}

/// @nodoc
class __$GetProvidersForEmailActionCopyWithImpl<$Res>
    extends _$GetProvidersForEmailActionCopyWithImpl<$Res>
    implements _$GetProvidersForEmailActionCopyWith<$Res> {
  __$GetProvidersForEmailActionCopyWithImpl(_GetProvidersForEmailAction _value,
      $Res Function(_GetProvidersForEmailAction) _then)
      : super(_value, (v) => _then(v as _GetProvidersForEmailAction));

  @override
  _GetProvidersForEmailAction get _value =>
      super._value as _GetProvidersForEmailAction;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_GetProvidersForEmailAction(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetProvidersForEmailAction implements _GetProvidersForEmailAction {
  _$_GetProvidersForEmailAction(this.email);

  factory _$_GetProvidersForEmailAction.fromJson(Map<String, dynamic> json) =>
      _$$_GetProvidersForEmailActionFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'GetProvidersForEmailAction(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetProvidersForEmailAction &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$GetProvidersForEmailActionCopyWith<_GetProvidersForEmailAction>
      get copyWith => __$GetProvidersForEmailActionCopyWithImpl<
          _GetProvidersForEmailAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetProvidersForEmailActionToJson(this);
  }
}

abstract class _GetProvidersForEmailAction
    implements GetProvidersForEmailAction {
  factory _GetProvidersForEmailAction(String email) =
      _$_GetProvidersForEmailAction;

  factory _GetProvidersForEmailAction.fromJson(Map<String, dynamic> json) =
      _$_GetProvidersForEmailAction.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetProvidersForEmailActionCopyWith<_GetProvidersForEmailAction>
      get copyWith => throw _privateConstructorUsedError;
}
