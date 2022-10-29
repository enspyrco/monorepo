import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import 'composite_menu_button.dart';
import 'menu_option.dart';
import 'profile_avatar.dart';

class AvatarMenuButton<S extends AstroState> extends StatefulWidget {
  const AvatarMenuButton(
      {required Set<MenuOption> options, required String photoURL, Key? key})
      : _options = options,
        _photoURL = photoURL,
        super(key: key);

  final Set<MenuOption> _options;
  final String _photoURL;

  @override
  State<AvatarMenuButton> createState() => _AvatarMenuButtonState<S>();
}

class _AvatarMenuButtonState<S extends AstroState>
    extends State<AvatarMenuButton> {
  final _popupKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return CompositeMenuButton<S>(
        options: widget._options,
        topButton: ProfileAvatar(widget._photoURL,
            onPressed: () => _popupKey.currentState?.showButtonMenu()),
        popupKey: _popupKey);
  }
}
