// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_email_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreEmailAction _$StoreEmailActionFromJson(Map<String, dynamic> json) {
  return _StoreEmailAction.fromJson(json);
}

/// @nodoc
class _$StoreEmailActionTearOff {
  const _$StoreEmailActionTearOff();

  _StoreEmailAction call(String? text) {
    return _StoreEmailAction(
      text,
    );
  }

  StoreEmailAction fromJson(Map<String, Object> json) {
    return StoreEmailAction.fromJson(json);
  }
}

/// @nodoc
const $StoreEmailAction = _$StoreEmailActionTearOff();

/// @nodoc
mixin _$StoreEmailAction {
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreEmailActionCopyWith<StoreEmailAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreEmailActionCopyWith<$Res> {
  factory $StoreEmailActionCopyWith(
          StoreEmailAction value, $Res Function(StoreEmailAction) then) =
      _$StoreEmailActionCopyWithImpl<$Res>;
  $Res call({String? text});
}

/// @nodoc
class _$StoreEmailActionCopyWithImpl<$Res>
    implements $StoreEmailActionCopyWith<$Res> {
  _$StoreEmailActionCopyWithImpl(this._value, this._then);

  final StoreEmailAction _value;
  // ignore: unused_field
  final $Res Function(StoreEmailAction) _then;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$StoreEmailActionCopyWith<$Res>
    implements $StoreEmailActionCopyWith<$Res> {
  factory _$StoreEmailActionCopyWith(
          _StoreEmailAction value, $Res Function(_StoreEmailAction) then) =
      __$StoreEmailActionCopyWithImpl<$Res>;
  @override
  $Res call({String? text});
}

/// @nodoc
class __$StoreEmailActionCopyWithImpl<$Res>
    extends _$StoreEmailActionCopyWithImpl<$Res>
    implements _$StoreEmailActionCopyWith<$Res> {
  __$StoreEmailActionCopyWithImpl(
      _StoreEmailAction _value, $Res Function(_StoreEmailAction) _then)
      : super(_value, (v) => _then(v as _StoreEmailAction));

  @override
  _StoreEmailAction get _value => super._value as _StoreEmailAction;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_StoreEmailAction(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreEmailAction implements _StoreEmailAction {
  _$_StoreEmailAction(this.text);

  factory _$_StoreEmailAction.fromJson(Map<String, dynamic> json) =>
      _$$_StoreEmailActionFromJson(json);

  @override
  final String? text;

  @override
  String toString() {
    return 'StoreEmailAction(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreEmailAction &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$StoreEmailActionCopyWith<_StoreEmailAction> get copyWith =>
      __$StoreEmailActionCopyWithImpl<_StoreEmailAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreEmailActionToJson(this);
  }
}

abstract class _StoreEmailAction implements StoreEmailAction {
  factory _StoreEmailAction(String? text) = _$_StoreEmailAction;

  factory _StoreEmailAction.fromJson(Map<String, dynamic> json) =
      _$_StoreEmailAction.fromJson;

  @override
  String? get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreEmailActionCopyWith<_StoreEmailAction> get copyWith =>
      throw _privateConstructorUsedError;
}
