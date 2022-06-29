import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../auth/models/auth_user_data.dart';
import '../../../../profile/widgets/profile_avatar.dart';
import '../../../../types/red_fire_state.dart';
import 'composite_menu_button.dart';
import 'menu_option.dart';

class AvatarMenuButton<T extends RedFireState> extends StatefulWidget {
  const AvatarMenuButton({Set<MenuOption>? options, Key? key})
      : _options = options ?? const {},
        super(key: key);

  final Set<MenuOption> _options;

  @override
  State<AvatarMenuButton> createState() => _AvatarMenuButtonState<T>();
}

class _AvatarMenuButtonState<T extends RedFireState>
    extends State<AvatarMenuButton> {
  final _popupKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return CompositeMenuButton<T>(
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
