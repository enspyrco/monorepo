// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_auth_user_data_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreAuthUserDataAction _$StoreAuthUserDataActionFromJson(
    Map<String, dynamic> json) {
  return _StoreAuthUserDataAction.fromJson(json);
}

/// @nodoc
class _$StoreAuthUserDataActionTearOff {
  const _$StoreAuthUserDataActionTearOff();

  _StoreAuthUserDataAction call(AuthUserData? authUserData) {
    return _StoreAuthUserDataAction(
      authUserData,
    );
  }

  StoreAuthUserDataAction fromJson(Map<String, Object> json) {
    return StoreAuthUserDataAction.fromJson(json);
  }
}

/// @nodoc
const $StoreAuthUserDataAction = _$StoreAuthUserDataActionTearOff();

/// @nodoc
mixin _$StoreAuthUserDataAction {
  AuthUserData? get authUserData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreAuthUserDataActionCopyWith<StoreAuthUserDataAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreAuthUserDataActionCopyWith<$Res> {
  factory $StoreAuthUserDataActionCopyWith(StoreAuthUserDataAction value,
          $Res Function(StoreAuthUserDataAction) then) =
      _$StoreAuthUserDataActionCopyWithImpl<$Res>;
  $Res call({AuthUserData? authUserData});

  $AuthUserDataCopyWith<$Res>? get authUserData;
}

/// @nodoc
class _$StoreAuthUserDataActionCopyWithImpl<$Res>
    implements $StoreAuthUserDataActionCopyWith<$Res> {
  _$StoreAuthUserDataActionCopyWithImpl(this._value, this._then);

  final StoreAuthUserDataAction _value;
  // ignore: unused_field
  final $Res Function(StoreAuthUserDataAction) _then;

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
abstract class _$StoreAuthUserDataActionCopyWith<$Res>
    implements $StoreAuthUserDataActionCopyWith<$Res> {
  factory _$StoreAuthUserDataActionCopyWith(_StoreAuthUserDataAction value,
          $Res Function(_StoreAuthUserDataAction) then) =
      __$StoreAuthUserDataActionCopyWithImpl<$Res>;
  @override
  $Res call({AuthUserData? authUserData});

  @override
  $AuthUserDataCopyWith<$Res>? get authUserData;
}

/// @nodoc
class __$StoreAuthUserDataActionCopyWithImpl<$Res>
    extends _$StoreAuthUserDataActionCopyWithImpl<$Res>
    implements _$StoreAuthUserDataActionCopyWith<$Res> {
  __$StoreAuthUserDataActionCopyWithImpl(_StoreAuthUserDataAction _value,
      $Res Function(_StoreAuthUserDataAction) _then)
      : super(_value, (v) => _then(v as _StoreAuthUserDataAction));

  @override
  _StoreAuthUserDataAction get _value =>
      super._value as _StoreAuthUserDataAction;

  @override
  $Res call({
    Object? authUserData = freezed,
  }) {
    return _then(_StoreAuthUserDataAction(
      authUserData == freezed
          ? _value.authUserData
          : authUserData // ignore: cast_nullable_to_non_nullable
              as AuthUserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreAuthUserDataAction implements _StoreAuthUserDataAction {
  _$_StoreAuthUserDataAction(this.authUserData);

  factory _$_StoreAuthUserDataAction.fromJson(Map<String, dynamic> json) =>
      _$$_StoreAuthUserDataActionFromJson(json);

  @override
  final AuthUserData? authUserData;

  @override
  String toString() {
    return 'StoreAuthUserDataAction(authUserData: $authUserData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreAuthUserDataAction &&
            (identical(other.authUserData, authUserData) ||
                const DeepCollectionEquality()
                    .equals(other.authUserData, authUserData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(authUserData);

  @JsonKey(ignore: true)
  @override
  _$StoreAuthUserDataActionCopyWith<_StoreAuthUserDataAction> get copyWith =>
      __$StoreAuthUserDataActionCopyWithImpl<_StoreAuthUserDataAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreAuthUserDataActionToJson(this);
  }
}

abstract class _StoreAuthUserDataAction implements StoreAuthUserDataAction {
  factory _StoreAuthUserDataAction(AuthUserData? authUserData) =
      _$_StoreAuthUserDataAction;

  factory _StoreAuthUserDataAction.fromJson(Map<String, dynamic> json) =
      _$_StoreAuthUserDataAction.fromJson;

  @override
  AuthUserData? get authUserData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreAuthUserDataActionCopyWith<_StoreAuthUserDataAction> get copyWith =>
      throw _privateConstructorUsedError;
}
