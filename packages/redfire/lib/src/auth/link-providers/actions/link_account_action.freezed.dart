// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'link_account_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LinkAccountAction _$LinkAccountActionFromJson(Map<String, dynamic> json) {
  return _LinkAccountAction.fromJson(json);
}

/// @nodoc
class _$LinkAccountActionTearOff {
  const _$LinkAccountActionTearOff();

  _LinkAccountAction call(ProvidersEnum provider) {
    return _LinkAccountAction(
      provider,
    );
  }

  LinkAccountAction fromJson(Map<String, Object?> json) {
    return LinkAccountAction.fromJson(json);
  }
}

/// @nodoc
const $LinkAccountAction = _$LinkAccountActionTearOff();

/// @nodoc
mixin _$LinkAccountAction {
  ProvidersEnum get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkAccountActionCopyWith<LinkAccountAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkAccountActionCopyWith<$Res> {
  factory $LinkAccountActionCopyWith(
          LinkAccountAction value, $Res Function(LinkAccountAction) then) =
      _$LinkAccountActionCopyWithImpl<$Res>;
  $Res call({ProvidersEnum provider});
}

/// @nodoc
class _$LinkAccountActionCopyWithImpl<$Res>
    implements $LinkAccountActionCopyWith<$Res> {
  _$LinkAccountActionCopyWithImpl(this._value, this._then);

  final LinkAccountAction _value;
  // ignore: unused_field
  final $Res Function(LinkAccountAction) _then;

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
abstract class _$LinkAccountActionCopyWith<$Res>
    implements $LinkAccountActionCopyWith<$Res> {
  factory _$LinkAccountActionCopyWith(
          _LinkAccountAction value, $Res Function(_LinkAccountAction) then) =
      __$LinkAccountActionCopyWithImpl<$Res>;
  @override
  $Res call({ProvidersEnum provider});
}

/// @nodoc
class __$LinkAccountActionCopyWithImpl<$Res>
    extends _$LinkAccountActionCopyWithImpl<$Res>
    implements _$LinkAccountActionCopyWith<$Res> {
  __$LinkAccountActionCopyWithImpl(
      _LinkAccountAction _value, $Res Function(_LinkAccountAction) _then)
      : super(_value, (v) => _then(v as _LinkAccountAction));

  @override
  _LinkAccountAction get _value => super._value as _LinkAccountAction;

  @override
  $Res call({
    Object? provider = freezed,
  }) {
    return _then(_LinkAccountAction(
      provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as ProvidersEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LinkAccountAction implements _LinkAccountAction {
  const _$_LinkAccountAction(this.provider);

  factory _$_LinkAccountAction.fromJson(Map<String, dynamic> json) =>
      _$$_LinkAccountActionFromJson(json);

  @override
  final ProvidersEnum provider;

  @override
  String toString() {
    return 'LinkAccountAction(provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinkAccountAction &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @override
  int get hashCode => Object.hash(runtimeType, provider);

  @JsonKey(ignore: true)
  @override
  _$LinkAccountActionCopyWith<_LinkAccountAction> get copyWith =>
      __$LinkAccountActionCopyWithImpl<_LinkAccountAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinkAccountActionToJson(this);
  }
}

abstract class _LinkAccountAction implements LinkAccountAction {
  const factory _LinkAccountAction(ProvidersEnum provider) =
      _$_LinkAccountAction;

  factory _LinkAccountAction.fromJson(Map<String, dynamic> json) =
      _$_LinkAccountAction.fromJson;

  @override
  ProvidersEnum get provider;
  @override
  @JsonKey(ignore: true)
  _$LinkAccountActionCopyWith<_LinkAccountAction> get copyWith =>
      throw _privateConstructorUsedError;
}
