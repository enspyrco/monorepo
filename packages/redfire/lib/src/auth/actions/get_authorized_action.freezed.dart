// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_authorized_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetAuthorizedAction _$GetAuthorizedActionFromJson(Map<String, dynamic> json) {
  return _GetAuthorizedAction.fromJson(json);
}

/// @nodoc
class _$GetAuthorizedActionTearOff {
  const _$GetAuthorizedActionTearOff();

  _GetAuthorizedAction call({required ProvidersEnum provider}) {
    return _GetAuthorizedAction(
      provider: provider,
    );
  }

  GetAuthorizedAction fromJson(Map<String, Object?> json) {
    return GetAuthorizedAction.fromJson(json);
  }
}

/// @nodoc
const $GetAuthorizedAction = _$GetAuthorizedActionTearOff();

/// @nodoc
mixin _$GetAuthorizedAction {
  ProvidersEnum get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAuthorizedActionCopyWith<GetAuthorizedAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAuthorizedActionCopyWith<$Res> {
  factory $GetAuthorizedActionCopyWith(
          GetAuthorizedAction value, $Res Function(GetAuthorizedAction) then) =
      _$GetAuthorizedActionCopyWithImpl<$Res>;
  $Res call({ProvidersEnum provider});
}

/// @nodoc
class _$GetAuthorizedActionCopyWithImpl<$Res>
    implements $GetAuthorizedActionCopyWith<$Res> {
  _$GetAuthorizedActionCopyWithImpl(this._value, this._then);

  final GetAuthorizedAction _value;
  // ignore: unused_field
  final $Res Function(GetAuthorizedAction) _then;

  @override
  $Res call({
    Object? provider = freezed,
  }) {
    return _then(_value.copyWith(
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as ProvidersEnum,
    ));
  }
}

/// @nodoc
abstract class _$GetAuthorizedActionCopyWith<$Res>
    implements $GetAuthorizedActionCopyWith<$Res> {
  factory _$GetAuthorizedActionCopyWith(_GetAuthorizedAction value,
          $Res Function(_GetAuthorizedAction) then) =
      __$GetAuthorizedActionCopyWithImpl<$Res>;
  @override
  $Res call({ProvidersEnum provider});
}

/// @nodoc
class __$GetAuthorizedActionCopyWithImpl<$Res>
    extends _$GetAuthorizedActionCopyWithImpl<$Res>
    implements _$GetAuthorizedActionCopyWith<$Res> {
  __$GetAuthorizedActionCopyWithImpl(
      _GetAuthorizedAction _value, $Res Function(_GetAuthorizedAction) _then)
      : super(_value, (v) => _then(v as _GetAuthorizedAction));

  @override
  _GetAuthorizedAction get _value => super._value as _GetAuthorizedAction;

  @override
  $Res call({
    Object? provider = freezed,
  }) {
    return _then(_GetAuthorizedAction(
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as ProvidersEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetAuthorizedAction extends _GetAuthorizedAction {
  const _$_GetAuthorizedAction({required this.provider}) : super._();

  factory _$_GetAuthorizedAction.fromJson(Map<String, dynamic> json) =>
      _$$_GetAuthorizedActionFromJson(json);

  @override
  final ProvidersEnum provider;

  @override
  String toString() {
    return 'GetAuthorizedAction(provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetAuthorizedAction &&
            const DeepCollectionEquality().equals(other.provider, provider));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(provider));

  @JsonKey(ignore: true)
  @override
  _$GetAuthorizedActionCopyWith<_GetAuthorizedAction> get copyWith =>
      __$GetAuthorizedActionCopyWithImpl<_GetAuthorizedAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetAuthorizedActionToJson(this);
  }
}

abstract class _GetAuthorizedAction extends GetAuthorizedAction {
  const factory _GetAuthorizedAction({required ProvidersEnum provider}) =
      _$_GetAuthorizedAction;
  const _GetAuthorizedAction._() : super._();

  factory _GetAuthorizedAction.fromJson(Map<String, dynamic> json) =
      _$_GetAuthorizedAction.fromJson;

  @override
  ProvidersEnum get provider;
  @override
  @JsonKey(ignore: true)
  _$GetAuthorizedActionCopyWith<_GetAuthorizedAction> get copyWith =>
      throw _privateConstructorUsedError;
}
