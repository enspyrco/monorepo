// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_auth_user_data_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetAuthUserDataAction _$SetAuthUserDataActionFromJson(
    Map<String, dynamic> json) {
  return _SetAuthUserDataAction.fromJson(json);
}

/// @nodoc
class _$SetAuthUserDataActionTearOff {
  const _$SetAuthUserDataActionTearOff();

  _SetAuthUserDataAction call(AuthUserData? authUserData) {
    return _SetAuthUserDataAction(
      authUserData,
    );
  }

  SetAuthUserDataAction fromJson(Map<String, Object?> json) {
    return SetAuthUserDataAction.fromJson(json);
  }
}

/// @nodoc
const $SetAuthUserDataAction = _$SetAuthUserDataActionTearOff();

/// @nodoc
mixin _$SetAuthUserDataAction {
  AuthUserData? get authUserData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetAuthUserDataActionCopyWith<SetAuthUserDataAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetAuthUserDataActionCopyWith<$Res> {
  factory $SetAuthUserDataActionCopyWith(SetAuthUserDataAction value,
          $Res Function(SetAuthUserDataAction) then) =
      _$SetAuthUserDataActionCopyWithImpl<$Res>;
  $Res call({AuthUserData? authUserData});

  $AuthUserDataCopyWith<$Res>? get authUserData;
}

/// @nodoc
class _$SetAuthUserDataActionCopyWithImpl<$Res>
    implements $SetAuthUserDataActionCopyWith<$Res> {
  _$SetAuthUserDataActionCopyWithImpl(this._value, this._then);

  final SetAuthUserDataAction _value;
  // ignore: unused_field
  final $Res Function(SetAuthUserDataAction) _then;

  @override
  $Res call({
    Object? authUserData = freezed,
  }) {
    return _then(_value.copyWith(
      authUserData: authUserData == freezed
          ? _value.authUserData
          : authUserData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
    ));
  }

  @override
  $AuthUserDataCopyWith<$Res>? get authUserData {
    if (_value.authUserData == null) {
      return null;
    }

    return $AuthUserDataCopyWith<$Res>(_value.authUserData!, (value) {
      return _then(_value.copyWith(authUserData: value));
    });
  }
}

/// @nodoc
abstract class _$SetAuthUserDataActionCopyWith<$Res>
    implements $SetAuthUserDataActionCopyWith<$Res> {
  factory _$SetAuthUserDataActionCopyWith(_SetAuthUserDataAction value,
          $Res Function(_SetAuthUserDataAction) then) =
      __$SetAuthUserDataActionCopyWithImpl<$Res>;
  @override
  $Res call({AuthUserData? authUserData});

  @override
  $AuthUserDataCopyWith<$Res>? get authUserData;
}

/// @nodoc
class __$SetAuthUserDataActionCopyWithImpl<$Res>
    extends _$SetAuthUserDataActionCopyWithImpl<$Res>
    implements _$SetAuthUserDataActionCopyWith<$Res> {
  __$SetAuthUserDataActionCopyWithImpl(_SetAuthUserDataAction _value,
      $Res Function(_SetAuthUserDataAction) _then)
      : super(_value, (v) => _then(v as _SetAuthUserDataAction));

  @override
  _SetAuthUserDataAction get _value => super._value as _SetAuthUserDataAction;

  @override
  $Res call({
    Object? authUserData = freezed,
  }) {
    return _then(_SetAuthUserDataAction(
      authUserData == freezed
          ? _value.authUserData
          : authUserData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetAuthUserDataAction extends _SetAuthUserDataAction {
  const _$_SetAuthUserDataAction(this.authUserData) : super._();

  factory _$_SetAuthUserDataAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetAuthUserDataActionFromJson(json);

  @override
  final AuthUserData? authUserData;

  @override
  String toString() {
    return 'SetAuthUserDataAction(authUserData: $authUserData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetAuthUserDataAction &&
            (identical(other.authUserData, authUserData) ||
                other.authUserData == authUserData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authUserData);

  @JsonKey(ignore: true)
  @override
  _$SetAuthUserDataActionCopyWith<_SetAuthUserDataAction> get copyWith =>
      __$SetAuthUserDataActionCopyWithImpl<_SetAuthUserDataAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetAuthUserDataActionToJson(this);
  }
}

abstract class _SetAuthUserDataAction extends SetAuthUserDataAction {
  const factory _SetAuthUserDataAction(AuthUserData? authUserData) =
      _$_SetAuthUserDataAction;
  const _SetAuthUserDataAction._() : super._();

  factory _SetAuthUserDataAction.fromJson(Map<String, dynamic> json) =
      _$_SetAuthUserDataAction.fromJson;

  @override
  AuthUserData? get authUserData;
  @override
  @JsonKey(ignore: true)
  _$SetAuthUserDataActionCopyWith<_SetAuthUserDataAction> get copyWith =>
      throw _privateConstructorUsedError;
}
