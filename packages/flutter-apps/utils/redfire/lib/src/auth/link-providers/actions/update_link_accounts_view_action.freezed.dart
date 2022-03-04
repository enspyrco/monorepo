// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_link_accounts_view_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateLinkAccountsViewAction _$UpdateLinkAccountsViewActionFromJson(
    Map<String, dynamic> json) {
  return _UpdateLinkAccountsViewAction.fromJson(json);
}

/// @nodoc
class _$UpdateLinkAccountsViewActionTearOff {
  const _$UpdateLinkAccountsViewActionTearOff();

  _UpdateLinkAccountsViewAction call(
      {required ProvidersEnum provider, required LinkingStateEnum state}) {
    return _UpdateLinkAccountsViewAction(
      provider: provider,
      state: state,
    );
  }

  UpdateLinkAccountsViewAction fromJson(Map<String, Object?> json) {
    return UpdateLinkAccountsViewAction.fromJson(json);
  }
}

/// @nodoc
const $UpdateLinkAccountsViewAction = _$UpdateLinkAccountsViewActionTearOff();

/// @nodoc
mixin _$UpdateLinkAccountsViewAction {
  ProvidersEnum get provider => throw _privateConstructorUsedError;
  LinkingStateEnum get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateLinkAccountsViewActionCopyWith<UpdateLinkAccountsViewAction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateLinkAccountsViewActionCopyWith<$Res> {
  factory $UpdateLinkAccountsViewActionCopyWith(
          UpdateLinkAccountsViewAction value,
          $Res Function(UpdateLinkAccountsViewAction) then) =
      _$UpdateLinkAccountsViewActionCopyWithImpl<$Res>;
  $Res call({ProvidersEnum provider, LinkingStateEnum state});
}

/// @nodoc
class _$UpdateLinkAccountsViewActionCopyWithImpl<$Res>
    implements $UpdateLinkAccountsViewActionCopyWith<$Res> {
  _$UpdateLinkAccountsViewActionCopyWithImpl(this._value, this._then);

  final UpdateLinkAccountsViewAction _value;
  // ignore: unused_field
  final $Res Function(UpdateLinkAccountsViewAction) _then;

  @override
  $Res call({
    Object? provider = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as ProvidersEnum,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as LinkingStateEnum,
    ));
  }
}

/// @nodoc
abstract class _$UpdateLinkAccountsViewActionCopyWith<$Res>
    implements $UpdateLinkAccountsViewActionCopyWith<$Res> {
  factory _$UpdateLinkAccountsViewActionCopyWith(
          _UpdateLinkAccountsViewAction value,
          $Res Function(_UpdateLinkAccountsViewAction) then) =
      __$UpdateLinkAccountsViewActionCopyWithImpl<$Res>;
  @override
  $Res call({ProvidersEnum provider, LinkingStateEnum state});
}

/// @nodoc
class __$UpdateLinkAccountsViewActionCopyWithImpl<$Res>
    extends _$UpdateLinkAccountsViewActionCopyWithImpl<$Res>
    implements _$UpdateLinkAccountsViewActionCopyWith<$Res> {
  __$UpdateLinkAccountsViewActionCopyWithImpl(
      _UpdateLinkAccountsViewAction _value,
      $Res Function(_UpdateLinkAccountsViewAction) _then)
      : super(_value, (v) => _then(v as _UpdateLinkAccountsViewAction));

  @override
  _UpdateLinkAccountsViewAction get _value =>
      super._value as _UpdateLinkAccountsViewAction;

  @override
  $Res call({
    Object? provider = freezed,
    Object? state = freezed,
  }) {
    return _then(_UpdateLinkAccountsViewAction(
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as ProvidersEnum,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as LinkingStateEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateLinkAccountsViewAction extends _UpdateLinkAccountsViewAction {
  const _$_UpdateLinkAccountsViewAction(
      {required this.provider, required this.state})
      : super._();

  factory _$_UpdateLinkAccountsViewAction.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateLinkAccountsViewActionFromJson(json);

  @override
  final ProvidersEnum provider;
  @override
  final LinkingStateEnum state;

  @override
  String toString() {
    return 'UpdateLinkAccountsViewAction(provider: $provider, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateLinkAccountsViewAction &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$UpdateLinkAccountsViewActionCopyWith<_UpdateLinkAccountsViewAction>
      get copyWith => __$UpdateLinkAccountsViewActionCopyWithImpl<
          _UpdateLinkAccountsViewAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateLinkAccountsViewActionToJson(this);
  }
}

abstract class _UpdateLinkAccountsViewAction
    extends UpdateLinkAccountsViewAction {
  const factory _UpdateLinkAccountsViewAction(
      {required ProvidersEnum provider,
      required LinkingStateEnum state}) = _$_UpdateLinkAccountsViewAction;
  const _UpdateLinkAccountsViewAction._() : super._();

  factory _UpdateLinkAccountsViewAction.fromJson(Map<String, dynamic> json) =
      _$_UpdateLinkAccountsViewAction.fromJson;

  @override
  ProvidersEnum get provider;
  @override
  LinkingStateEnum get state;
  @override
  @JsonKey(ignore: true)
  _$UpdateLinkAccountsViewActionCopyWith<_UpdateLinkAccountsViewAction>
      get copyWith => throw _privateConstructorUsedError;
}
