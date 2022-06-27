import 'package:flutter/material.dart';

import '../../../../../types.dart';
import 'hidden_popup_menu_button.dart';
import 'menu_button_option.dart';

/// The button actually consists of two buttons in a stack.  A [PopupMenuButton]
/// and the injected [topButton], eg. [AvatarMenuButton] passed in our
/// custom-made [ProfileAvatar].
///
/// The [PopupMenuButton] is disabled but the [topButton] is setup to open
/// the [PopupMenuButton]'s menu.
///
/// A global key is given to [HiddenPopupMenuButton] to be used as the
/// [PopupMenuButton]'s key. The key is also used by the [topButton] to pop the
/// menu.
class RedFireMenuButton<T extends RedFireState> extends StatelessWidget {
  const RedFireMenuButton(
      {required Widget topButton,
      Set<MenuButtonOption>? options,
      required GlobalKey<PopupMenuButtonState> popupKey,
      Key? key})
      : _topButton = topButton,
        _options = options ?? const {},
        _popupKey = popupKey,
        super(key: key);

  final Set<MenuButtonOption> _options;
  final Widget _topButton;
  final GlobalKey<PopupMenuButtonState> _popupKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HiddenPopupMenuButton<T>(_popupKey, _options),
        Padding(padding: const EdgeInsets.all(8.0), child: _topButton),
      ],
    );
  }
}
