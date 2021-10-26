// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'link_accounts_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LinkAccountsViewModel _$LinkAccountsViewModelFromJson(
    Map<String, dynamic> json) {
  return _LinkAccountsViewModel.fromJson(json);
}

/// @nodoc
class _$LinkAccountsViewModelTearOff {
  const _$LinkAccountsViewModelTearOff();

  _LinkAccountsViewModel call(IMap<ProvidersEnum, LinkingStateEnum> providers) {
    return _LinkAccountsViewModel(
      providers,
    );
  }

  LinkAccountsViewModel fromJson(Map<String, Object?> json) {
    return LinkAccountsViewModel.fromJson(json);
  }
}

/// @nodoc
const $LinkAccountsViewModel = _$LinkAccountsViewModelTearOff();

/// @nodoc
mixin _$LinkAccountsViewModel {
  IMap<ProvidersEnum, LinkingStateEnum> get providers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkAccountsViewModelCopyWith<LinkAccountsViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkAccountsViewModelCopyWith<$Res> {
  factory $LinkAccountsViewModelCopyWith(LinkAccountsViewModel value,
          $Res Function(LinkAccountsViewModel) then) =
      _$LinkAccountsViewModelCopyWithImpl<$Res>;
  $Res call({IMap<ProvidersEnum, LinkingStateEnum> providers});
}

/// @nodoc
class _$LinkAccountsViewModelCopyWithImpl<$Res>
    implements $LinkAccountsViewModelCopyWith<$Res> {
  _$LinkAccountsViewModelCopyWithImpl(this._value, this._then);

  final LinkAccountsViewModel _value;
  // ignore: unused_field
  final $Res Function(LinkAccountsViewModel) _then;

  @override
  $Res call({
    Object? providers = freezed,
  }) {
    return _then(_value.copyWith(
      providers: providers == freezed
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as IMap<ProvidersEnum, LinkingStateEnum>,
    ));
  }
}

/// @nodoc
abstract class _$LinkAccountsViewModelCopyWith<$Res>
    implements $LinkAccountsViewModelCopyWith<$Res> {
  factory _$LinkAccountsViewModelCopyWith(_LinkAccountsViewModel value,
          $Res Function(_LinkAccountsViewModel) then) =
      __$LinkAccountsViewModelCopyWithImpl<$Res>;
  @override
  $Res call({IMap<ProvidersEnum, LinkingStateEnum> providers});
}

/// @nodoc
class __$LinkAccountsViewModelCopyWithImpl<$Res>
    extends _$LinkAccountsViewModelCopyWithImpl<$Res>
    implements _$LinkAccountsViewModelCopyWith<$Res> {
  __$LinkAccountsViewModelCopyWithImpl(_LinkAccountsViewModel _value,
      $Res Function(_LinkAccountsViewModel) _then)
      : super(_value, (v) => _then(v as _LinkAccountsViewModel));

  @override
  _LinkAccountsViewModel get _value => super._value as _LinkAccountsViewModel;

  @override
  $Res call({
    Object? providers = freezed,
  }) {
    return _then(_LinkAccountsViewModel(
      providers == freezed
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as IMap<ProvidersEnum, LinkingStateEnum>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LinkAccountsViewModel implements _LinkAccountsViewModel {
  const _$_LinkAccountsViewModel(this.providers);

  factory _$_LinkAccountsViewModel.fromJson(Map<String, dynamic> json) =>
      _$$_LinkAccountsViewModelFromJson(json);

  @override
  final IMap<ProvidersEnum, LinkingStateEnum> providers;

  @override
  String toString() {
    return 'LinkAccountsViewModel(providers: $providers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinkAccountsViewModel &&
            (identical(other.providers, providers) ||
                other.providers == providers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, providers);

  @JsonKey(ignore: true)
  @override
  _$LinkAccountsViewModelCopyWith<_LinkAccountsViewModel> get copyWith =>
      __$LinkAccountsViewModelCopyWithImpl<_LinkAccountsViewModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinkAccountsViewModelToJson(this);
  }
}

abstract class _LinkAccountsViewModel implements LinkAccountsViewModel {
  const factory _LinkAccountsViewModel(
          IMap<ProvidersEnum, LinkingStateEnum> providers) =
      _$_LinkAccountsViewModel;

  factory _LinkAccountsViewModel.fromJson(Map<String, dynamic> json) =
      _$_LinkAccountsViewModel.fromJson;

  @override
  IMap<ProvidersEnum, LinkingStateEnum> get providers;
  @override
  @JsonKey(ignore: true)
  _$LinkAccountsViewModelCopyWith<_LinkAccountsViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
