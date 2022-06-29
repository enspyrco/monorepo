import 'package:flutter/material.dart';

import '../../../../types/red_fire_state.dart';
import 'menu_option.dart';

class HiddenPopupMenuButton<T extends RedFireState> extends StatelessWidget {
  const HiddenPopupMenuButton(this._key, Set<MenuOption> options, {Key? key})
      : _options = options,
        super(key: key);

  final Key _key;
  final Set<MenuOption> _options;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      key: _key,
      child: Container(color: Colors.red),
      enabled: false,
      onSelected: (option) => option.dispatchAction<T>(context),
      itemBuilder: (context) => _options
          .map<PopupMenuEntry<MenuOption>>(
              (option) => PopupMenuItem<MenuOption>(
                    value: option,
                    child: Text(option.name),
                  ))
          .toList(),
    );
  }
}
