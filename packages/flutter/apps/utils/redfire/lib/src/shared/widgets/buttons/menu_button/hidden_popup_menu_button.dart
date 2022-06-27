import 'package:flutter/material.dart';

import '../../../../auth/actions/sign_out_action.dart';
import '../../../../navigation/actions/push_page_action.dart';
import '../../../../navigation/models/profile_page_data.dart';
import '../../../../redux/extensions/build_context_extensions.dart';
import '../../../../types/red_fire_state.dart';
import 'menu_button_option.dart';

class HiddenPopupMenuButton<T extends RedFireState> extends StatelessWidget {
  HiddenPopupMenuButton(this._key, Set<MenuButtonOption> options, {Key? key})
      : _options = options,
        super(key: key) {
    _options.addAll([
      MenuButtonOption(
          'Account Details',
          (context) =>
              context.dispatch<T>(const PushPageAction(ProfilePageData()))),
      MenuButtonOption('Sign Out',
          (BuildContext context) => context.dispatch<T>(const SignOutAction()))
    ]);
  }

  final Key _key;
  final Set<MenuButtonOption> _options;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuButtonOption>(
      key: _key,
      child: Container(color: Colors.red),
      enabled: false,
      onSelected: (option) => option.callback(context),
      itemBuilder: (context) => _options
          .map<PopupMenuEntry<MenuButtonOption>>(
              (option) => PopupMenuItem<MenuButtonOption>(
                    value: option,
                    child: Text(option.name),
                  ))
          .toList(),
    );
  }
}
