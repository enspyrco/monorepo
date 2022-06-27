import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../auth/models/auth_user_data.dart';
import '../../../../profile/widgets/profile_avatar.dart';
import '../../../../types/red_fire_state.dart';
import 'menu_button_option.dart';
import 'redfire_menu_button.dart';

class AvatarMenuButton<T extends RedFireState> extends StatefulWidget {
  const AvatarMenuButton({Set<MenuButtonOption>? options, Key? key})
      : _options = options ?? const {},
        super(key: key);

  final Set<MenuButtonOption> _options;

  @override
  State<AvatarMenuButton> createState() => _AvatarMenuButtonState<T>();
}

class _AvatarMenuButtonState<T extends RedFireState>
    extends State<AvatarMenuButton> {
  final _popupKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return RedFireMenuButton<T>(
        options: widget._options,
        topButton: StoreConnector<T, AuthUserData?>(
            distinct: true,
            converter: (store) => store.state.auth.userData,
            builder: (context, userData) {
              return ProfileAvatar(userData?.photoURL,
                  onPressed: () => _popupKey.currentState?.showButtonMenu());
            }),
        popupKey: _popupKey);
  }
}
