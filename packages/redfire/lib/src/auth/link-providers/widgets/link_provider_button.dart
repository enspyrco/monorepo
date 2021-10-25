import 'package:flutter/material.dart';
import 'package:redfire/src/auth/enums/providers_enum.dart';
import 'package:redfire/src/shared/icons/red_fire_icons_icons.dart';

class LinkProviderButton extends StatelessWidget {
  const LinkProviderButton(ProvidersEnum provider, {Key? key})
      : _provider = provider,
        super(key: key);

  final ProvidersEnum _provider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: const Icon(RedFireIcons.mark_github));
    // ElevatedButton.icon(
    //     onPressed: () {},
    //     icon: const Icon(Icons.ac_unit),
    //     label: Text(_provider.toString()));
  }
}
