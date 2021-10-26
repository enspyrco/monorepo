// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_accounts_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LinkAccountsViewModel _$$_LinkAccountsViewModelFromJson(
        Map<String, dynamic> json) =>
    _$_LinkAccountsViewModel(
      IMap<ProvidersEnum, LinkingStateEnum>.fromJson(
          json['providers'] as Map<String, dynamic>,
          (value) => $enumDecode(_$ProvidersEnumEnumMap, value),
          (value) => $enumDecode(_$LinkingStateEnumEnumMap, value)),
    );

Map<String, dynamic> _$$_LinkAccountsViewModelToJson(
        _$_LinkAccountsViewModel instance) =>
    <String, dynamic>{
      'providers': instance.providers.toJson(
        (value) => _$ProvidersEnumEnumMap[value],
        (value) => _$LinkingStateEnumEnumMap[value],
      ),
    };

const _$ProvidersEnumEnumMap = {
  ProvidersEnum.apple: 'APPLE',
  ProvidersEnum.google: 'GOOGLE',
  ProvidersEnum.email: 'EMAIL',
  ProvidersEnum.gitHub: 'GIT_HUB',
};

const _$LinkingStateEnumEnumMap = {
  LinkingStateEnum.unlinked: 'unlinked',
  LinkingStateEnum.linking: 'linking',
  LinkingStateEnum.linked: 'linked',
};
