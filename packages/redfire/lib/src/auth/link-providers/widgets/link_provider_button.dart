import 'package:flutter/material.dart';
import 'package:redfire/src/auth/constants/auth_provider_names.dart';
import 'package:redfire/src/auth/enums/providers_enum.dart';

class LinkProviderButton extends StatelessWidget {
  const LinkProviderButton(ProvidersEnum provider, {Key? key})
      : _provider = provider,
        super(key: key);

  final ProvidersEnum _provider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: Icon(authProviderIconFrom[_provider]));
    // ElevatedButton.icon(
    //     onPressed: () {},
    //     icon: const Icon(Icons.ac_unit),
    //     label: Text(_provider.toString()));
  }
}
