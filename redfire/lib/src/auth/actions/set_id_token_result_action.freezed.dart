// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_id_token_result_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetIdTokenResultAction _$SetIdTokenResultActionFromJson(
    Map<String, dynamic> json) {
  return _SetIdTokenResultAction.fromJson(json);
}

/// @nodoc
class _$SetIdTokenResultActionTearOff {
  const _$SetIdTokenResultActionTearOff();

  _SetIdTokenResultAction call(IdTokenResult result) {
    return _SetIdTokenResultAction(
      result,
    );
  }

  SetIdTokenResultAction fromJson(Map<String, Object> json) {
    return SetIdTokenResultAction.fromJson(json);
  }
}

/// @nodoc
const $SetIdTokenResultAction = _$SetIdTokenResultActionTearOff();

/// @nodoc
mixin _$SetIdTokenResultAction {
  IdTokenResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetIdTokenResultActionCopyWith<SetIdTokenResultAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetIdTokenResultActionCopyWith<$Res> {
  factory $SetIdTokenResultActionCopyWith(SetIdTokenResultAction value,
          $Res Function(SetIdTokenResultAction) then) =
      _$SetIdTokenResultActionCopyWithImpl<$Res>;
  $Res call({IdTokenResult result});

  $IdTokenResultCopyWith<$Res> get result;
}

/// @nodoc
class _$SetIdTokenResultActionCopyWithImpl<$Res>
    implements $SetIdTokenResultActionCopyWith<$Res> {
  _$SetIdTokenResultActionCopyWithImpl(this._value, this._then);

  final SetIdTokenResultAction _value;
  // ignore: unused_field
  final $Res Function(SetIdTokenResultAction) _then;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as IdTokenResult,
    ));
  }

  @override
  $IdTokenResultCopyWith<$Res> get result {
    return $IdTokenResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc
abstract class _$SetIdTokenResultActionCopyWith<$Res>
    implements $SetIdTokenResultActionCopyWith<$Res> {
  factory _$SetIdTokenResultActionCopyWith(_SetIdTokenResultAction value,
          $Res Function(_SetIdTokenResultAction) then) =
      __$SetIdTokenResultActionCopyWithImpl<$Res>;
  @override
  $Res call({IdTokenResult result});

  @override
  $IdTokenResultCopyWith<$Res> get result;
}

/// @nodoc
class __$SetIdTokenResultActionCopyWithImpl<$Res>
    extends _$SetIdTokenResultActionCopyWithImpl<$Res>
    implements _$SetIdTokenResultActionCopyWith<$Res> {
  __$SetIdTokenResultActionCopyWithImpl(_SetIdTokenResultAction _value,
      $Res Function(_SetIdTokenResultAction) _then)
      : super(_value, (v) => _then(v as _SetIdTokenResultAction));

  @override
  _SetIdTokenResultAction get _value => super._value as _SetIdTokenResultAction;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_SetIdTokenResultAction(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as IdTokenResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetIdTokenResultAction implements _SetIdTokenResultAction {
  _$_SetIdTokenResultAction(this.result);

  factory _$_SetIdTokenResultAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetIdTokenResultActionFromJson(json);

  @override
  final IdTokenResult result;

  @override
  String toString() {
    return 'SetIdTokenResultAction(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetIdTokenResultAction &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @JsonKey(ignore: true)
  @override
  _$SetIdTokenResultActionCopyWith<_SetIdTokenResultAction> get copyWith =>
      __$SetIdTokenResultActionCopyWithImpl<_SetIdTokenResultAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetIdTokenResultActionToJson(this);
  }
}

abstract class _SetIdTokenResultAction implements SetIdTokenResultAction {
  factory _SetIdTokenResultAction(IdTokenResult result) =
      _$_SetIdTokenResultAction;

  factory _SetIdTokenResultAction.fromJson(Map<String, dynamic> json) =
      _$_SetIdTokenResultAction.fromJson;

  @override
  IdTokenResult get result => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SetIdTokenResultActionCopyWith<_SetIdTokenResultAction> get copyWith =>
      throw _privateConstructorUsedError;
}
