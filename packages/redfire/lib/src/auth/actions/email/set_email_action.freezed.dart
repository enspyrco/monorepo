// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_email_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetEmailAction _$SetEmailActionFromJson(Map<String, dynamic> json) {
  return _SetEmailAction.fromJson(json);
}

/// @nodoc
class _$SetEmailActionTearOff {
  const _$SetEmailActionTearOff();

  _SetEmailAction call(String? text) {
    return _SetEmailAction(
      text,
    );
  }

  SetEmailAction fromJson(Map<String, Object?> json) {
    return SetEmailAction.fromJson(json);
  }
}

/// @nodoc
const $SetEmailAction = _$SetEmailActionTearOff();

/// @nodoc
mixin _$SetEmailAction {
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetEmailActionCopyWith<SetEmailAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetEmailActionCopyWith<$Res> {
  factory $SetEmailActionCopyWith(
          SetEmailAction value, $Res Function(SetEmailAction) then) =
      _$SetEmailActionCopyWithImpl<$Res>;
  $Res call({String? text});
}

/// @nodoc
class _$SetEmailActionCopyWithImpl<$Res>
    implements $SetEmailActionCopyWith<$Res> {
  _$SetEmailActionCopyWithImpl(this._value, this._then);

  final SetEmailAction _value;
  // ignore: unused_field
  final $Res Function(SetEmailAction) _then;

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
abstract class _$SetEmailActionCopyWith<$Res>
    implements $SetEmailActionCopyWith<$Res> {
  factory _$SetEmailActionCopyWith(
          _SetEmailAction value, $Res Function(_SetEmailAction) then) =
      __$SetEmailActionCopyWithImpl<$Res>;
  @override
  $Res call({String? text});
}

/// @nodoc
class __$SetEmailActionCopyWithImpl<$Res>
    extends _$SetEmailActionCopyWithImpl<$Res>
    implements _$SetEmailActionCopyWith<$Res> {
  __$SetEmailActionCopyWithImpl(
      _SetEmailAction _value, $Res Function(_SetEmailAction) _then)
      : super(_value, (v) => _then(v as _SetEmailAction));

  @override
  _SetEmailAction get _value => super._value as _SetEmailAction;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_SetEmailAction(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetEmailAction extends _SetEmailAction {
  _$_SetEmailAction(this.text) : super._();

  factory _$_SetEmailAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetEmailActionFromJson(json);

  @override
  final String? text;

  @override
  String toString() {
    return 'SetEmailAction(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetEmailAction &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  _$SetEmailActionCopyWith<_SetEmailAction> get copyWith =>
      __$SetEmailActionCopyWithImpl<_SetEmailAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetEmailActionToJson(this);
  }
}

abstract class _SetEmailAction extends SetEmailAction {
  factory _SetEmailAction(String? text) = _$_SetEmailAction;
  _SetEmailAction._() : super._();

  factory _SetEmailAction.fromJson(Map<String, dynamic> json) =
      _$_SetEmailAction.fromJson;

  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$SetEmailActionCopyWith<_SetEmailAction> get copyWith =>
      throw _privateConstructorUsedError;
}
