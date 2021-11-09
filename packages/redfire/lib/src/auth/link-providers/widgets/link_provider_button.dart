import 'package:flutter/material.dart';
import 'package:redfire/src/auth/constants/auth_provider_names.dart';
import 'package:redfire/src/auth/enums/providers_enum.dart';
import 'package:redfire/src/auth/link-providers/actions/link_account_action.dart';
import 'package:redfire/src/auth/link-providers/enums/linking_account_enum.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/types.dart';

class LinkProviderButton<T extends RedFireState> extends StatelessWidget {
  const LinkProviderButton(
      ProvidersEnum provider, LinkingStateEnum linkingState,
      {Key? key})
      : _provider = provider,
        _linkingState = linkingState,
        super(key: key);

  final ProvidersEnum _provider;
  final LinkingStateEnum _linkingState;

  @override
  Widget build(BuildContext context) {
    return (_linkingState == LinkingStateEnum.linking)
        ? const CircularProgressIndicator()
        : IconButton(
            onPressed: (_linkingState == LinkingStateEnum.linked)
                ? null
                : () => context.dispatch<T>(LinkAccountAction(_provider)),
            icon: Icon(authProviderIconFrom[_provider]));
  }
}
