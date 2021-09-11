// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_sign_in_methods_for_email_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreSignInMethodsForEmailAction _$StoreSignInMethodsForEmailActionFromJson(
    Map<String, dynamic> json) {
  return _StoreSignInMethodsForEmailAction.fromJson(json);
}

/// @nodoc
class _$StoreSignInMethodsForEmailActionTearOff {
  const _$StoreSignInMethodsForEmailActionTearOff();

  _StoreSignInMethodsForEmailAction call(List<String> methods) {
    return _StoreSignInMethodsForEmailAction(
      methods,
    );
  }

  StoreSignInMethodsForEmailAction fromJson(Map<String, Object> json) {
    return StoreSignInMethodsForEmailAction.fromJson(json);
  }
}

/// @nodoc
const $StoreSignInMethodsForEmailAction =
    _$StoreSignInMethodsForEmailActionTearOff();

/// @nodoc
mixin _$StoreSignInMethodsForEmailAction {
  List<String> get methods => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreSignInMethodsForEmailActionCopyWith<StoreSignInMethodsForEmailAction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreSignInMethodsForEmailActionCopyWith<$Res> {
  factory $StoreSignInMethodsForEmailActionCopyWith(
          StoreSignInMethodsForEmailAction value,
          $Res Function(StoreSignInMethodsForEmailAction) then) =
      _$StoreSignInMethodsForEmailActionCopyWithImpl<$Res>;
  $Res call({List<String> methods});
}

/// @nodoc
class _$StoreSignInMethodsForEmailActionCopyWithImpl<$Res>
    implements $StoreSignInMethodsForEmailActionCopyWith<$Res> {
  _$StoreSignInMethodsForEmailActionCopyWithImpl(this._value, this._then);

  final StoreSignInMethodsForEmailAction _value;
  // ignore: unused_field
  final $Res Function(StoreSignInMethodsForEmailAction) _then;

  @override
  $Res call({
    Object? methods = freezed,
  }) {
    return _then(_value.copyWith(
      methods: methods == freezed
          ? _value.methods
          : methods // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$StoreSignInMethodsForEmailActionCopyWith<$Res>
    implements $StoreSignInMethodsForEmailActionCopyWith<$Res> {
  factory _$StoreSignInMethodsForEmailActionCopyWith(
          _StoreSignInMethodsForEmailAction value,
          $Res Function(_StoreSignInMethodsForEmailAction) then) =
      __$StoreSignInMethodsForEmailActionCopyWithImpl<$Res>;
  @override
  $Res call({List<String> methods});
}

/// @nodoc
class __$StoreSignInMethodsForEmailActionCopyWithImpl<$Res>
    extends _$StoreSignInMethodsForEmailActionCopyWithImpl<$Res>
    implements _$StoreSignInMethodsForEmailActionCopyWith<$Res> {
  __$StoreSignInMethodsForEmailActionCopyWithImpl(
      _StoreSignInMethodsForEmailAction _value,
      $Res Function(_StoreSignInMethodsForEmailAction) _then)
      : super(_value, (v) => _then(v as _StoreSignInMethodsForEmailAction));

  @override
  _StoreSignInMethodsForEmailAction get _value =>
      super._value as _StoreSignInMethodsForEmailAction;

  @override
  $Res call({
    Object? methods = freezed,
  }) {
    return _then(_StoreSignInMethodsForEmailAction(
      methods == freezed
          ? _value.methods
          : methods // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreSignInMethodsForEmailAction
    implements _StoreSignInMethodsForEmailAction {
  _$_StoreSignInMethodsForEmailAction(this.methods);

  factory _$_StoreSignInMethodsForEmailAction.fromJson(
          Map<String, dynamic> json) =>
      _$$_StoreSignInMethodsForEmailActionFromJson(json);

  @override
  final List<String> methods;

  @override
  String toString() {
    return 'StoreSignInMethodsForEmailAction(methods: $methods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreSignInMethodsForEmailAction &&
            (identical(other.methods, methods) ||
                const DeepCollectionEquality().equals(other.methods, methods)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(methods);

  @JsonKey(ignore: true)
  @override
  _$StoreSignInMethodsForEmailActionCopyWith<_StoreSignInMethodsForEmailAction>
      get copyWith => __$StoreSignInMethodsForEmailActionCopyWithImpl<
          _StoreSignInMethodsForEmailAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreSignInMethodsForEmailActionToJson(this);
  }
}

abstract class _StoreSignInMethodsForEmailAction
    implements StoreSignInMethodsForEmailAction {
  factory _StoreSignInMethodsForEmailAction(List<String> methods) =
      _$_StoreSignInMethodsForEmailAction;

  factory _StoreSignInMethodsForEmailAction.fromJson(
      Map<String, dynamic> json) = _$_StoreSignInMethodsForEmailAction.fromJson;

  @override
  List<String> get methods => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreSignInMethodsForEmailActionCopyWith<_StoreSignInMethodsForEmailAction>
      get copyWith => throw _privateConstructorUsedError;
}
