import 'package:flutter/material.dart';
import 'package:redfire/src/auth/constants/auth_provider_names.dart';
import 'package:redfire/src/auth/enums/providers_enum.dart';
import 'package:redfire/src/auth/link-providers/actions/link_account_action.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/types.dart';

class LinkProviderButton<T extends RedFireState> extends StatelessWidget {
  const LinkProviderButton(ProvidersEnum provider, AuthUserData userData,
      {Key? key})
      : _provider = provider,
        _userData = userData,
        super(key: key);

  final ProvidersEnum _provider;
  final AuthUserData _userData;

  @override
  Widget build(BuildContext context) {
    var linked = false;
    var providerId = authProviderIdOf[_provider];
    for (var provider in _userData.providers) {
      if (provider.providerId == providerId) {
        linked = true;
        break;
      }
    }
    return IconButton(
        onPressed: linked
            ? null
            : () => context.dispatch<T>(LinkAccountAction(_provider)),
        icon: Icon(authProviderIconFrom[_provider]));
    // ElevatedButton.icon(
    //     onPressed: () {},
    //     icon: const Icon(Icons.ac_unit),
    //     label: Text(_provider.toString()));
  }
}
