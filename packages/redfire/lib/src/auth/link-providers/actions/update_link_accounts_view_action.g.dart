// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_link_accounts_view_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateLinkAccountsViewAction _$$_UpdateLinkAccountsViewActionFromJson(
        Map<String, dynamic> json) =>
    _$_UpdateLinkAccountsViewAction(
      provider: $enumDecode(_$ProvidersEnumEnumMap, json['provider']),
      state: $enumDecode(_$LinkingStateEnumEnumMap, json['state']),
    );

Map<String, dynamic> _$$_UpdateLinkAccountsViewActionToJson(
        _$_UpdateLinkAccountsViewAction instance) =>
    <String, dynamic>{
      'provider': _$ProvidersEnumEnumMap[instance.provider],
      'state': _$LinkingStateEnumEnumMap[instance.state],
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
