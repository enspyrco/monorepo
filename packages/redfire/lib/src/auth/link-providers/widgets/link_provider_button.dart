import 'package:flutter/material.dart';

import '../../../../types.dart';
import '../../../redux/extensions/build_context_extensions.dart';
import '../../constants/auth_provider_names.dart';
import '../../enums/providers_enum.dart';
import '../actions/link_account_action.dart';
import '../enums/linking_account_enum.dart';

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
