// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_providers_for_email_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetProvidersForEmailAction _$SetProvidersForEmailActionFromJson(
    Map<String, dynamic> json) {
  return _SetProvidersForEmailAction.fromJson(json);
}

/// @nodoc
class _$SetProvidersForEmailActionTearOff {
  const _$SetProvidersForEmailActionTearOff();

  _SetProvidersForEmailAction call(ISet<ProvidersEnum> providers) {
    return _SetProvidersForEmailAction(
      providers,
    );
  }

  SetProvidersForEmailAction fromJson(Map<String, Object?> json) {
    return SetProvidersForEmailAction.fromJson(json);
  }
}

/// @nodoc
const $SetProvidersForEmailAction = _$SetProvidersForEmailActionTearOff();

/// @nodoc
mixin _$SetProvidersForEmailAction {
  ISet<ProvidersEnum> get providers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetProvidersForEmailActionCopyWith<SetProvidersForEmailAction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetProvidersForEmailActionCopyWith<$Res> {
  factory $SetProvidersForEmailActionCopyWith(SetProvidersForEmailAction value,
          $Res Function(SetProvidersForEmailAction) then) =
      _$SetProvidersForEmailActionCopyWithImpl<$Res>;
  $Res call({ISet<ProvidersEnum> providers});
}

/// @nodoc
class _$SetProvidersForEmailActionCopyWithImpl<$Res>
    implements $SetProvidersForEmailActionCopyWith<$Res> {
  _$SetProvidersForEmailActionCopyWithImpl(this._value, this._then);

  final SetProvidersForEmailAction _value;
  // ignore: unused_field
  final $Res Function(SetProvidersForEmailAction) _then;

  @override
  $Res call({
    Object? providers = freezed,
  }) {
    return _then(_value.copyWith(
      providers: providers == freezed
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as ISet<ProvidersEnum>,
    ));
  }
}

/// @nodoc
abstract class _$SetProvidersForEmailActionCopyWith<$Res>
    implements $SetProvidersForEmailActionCopyWith<$Res> {
  factory _$SetProvidersForEmailActionCopyWith(
          _SetProvidersForEmailAction value,
          $Res Function(_SetProvidersForEmailAction) then) =
      __$SetProvidersForEmailActionCopyWithImpl<$Res>;
  @override
  $Res call({ISet<ProvidersEnum> providers});
}

/// @nodoc
class __$SetProvidersForEmailActionCopyWithImpl<$Res>
    extends _$SetProvidersForEmailActionCopyWithImpl<$Res>
    implements _$SetProvidersForEmailActionCopyWith<$Res> {
  __$SetProvidersForEmailActionCopyWithImpl(_SetProvidersForEmailAction _value,
      $Res Function(_SetProvidersForEmailAction) _then)
      : super(_value, (v) => _then(v as _SetProvidersForEmailAction));

  @override
  _SetProvidersForEmailAction get _value =>
      super._value as _SetProvidersForEmailAction;

  @override
  $Res call({
    Object? providers = freezed,
  }) {
    return _then(_SetProvidersForEmailAction(
      providers == freezed
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as ISet<ProvidersEnum>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetProvidersForEmailAction implements _SetProvidersForEmailAction {
  _$_SetProvidersForEmailAction(this.providers);

  factory _$_SetProvidersForEmailAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetProvidersForEmailActionFromJson(json);

  @override
  final ISet<ProvidersEnum> providers;

  @override
  String toString() {
    return 'SetProvidersForEmailAction(providers: $providers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetProvidersForEmailAction &&
            (identical(other.providers, providers) ||
                other.providers == providers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, providers);

  @JsonKey(ignore: true)
  @override
  _$SetProvidersForEmailActionCopyWith<_SetProvidersForEmailAction>
      get copyWith => __$SetProvidersForEmailActionCopyWithImpl<
          _SetProvidersForEmailAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetProvidersForEmailActionToJson(this);
  }
}

abstract class _SetProvidersForEmailAction
    implements SetProvidersForEmailAction {
  factory _SetProvidersForEmailAction(ISet<ProvidersEnum> providers) =
      _$_SetProvidersForEmailAction;

  factory _SetProvidersForEmailAction.fromJson(Map<String, dynamic> json) =
      _$_SetProvidersForEmailAction.fromJson;

  @override
  ISet<ProvidersEnum> get providers;
  @override
  @JsonKey(ignore: true)
  _$SetProvidersForEmailActionCopyWith<_SetProvidersForEmailAction>
      get copyWith => throw _privateConstructorUsedError;
}
