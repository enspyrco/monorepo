import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/auth/actions/sign_out_action.dart';
import 'package:redfire/src/navigation/actions/push_page_action.dart';
import 'package:redfire/src/profile/widgets/profile_avatar.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/types.dart';

/// Class extends [StatefulWidget] so we can keep a global key as state.
///
/// The button actually consists of two buttons in a stack.  A [PopupMenuButton]
/// and our custom-made [ProfileAvatar].
///
/// The [PopupMenuButton] is disabled but the [ProfileAvatar] is setup to open
/// the [PopupMenuButton]'s menu.
///
/// The global key is used as the [PopupMenuButton]'s key and given to the
/// [ProfileAvatar] so it can pop the menu.
///
class AccountButton<T extends RedFireState> extends StatefulWidget {
  const AccountButton({ISet<AccountButtonOption>? options, Key? key})
      : _options = options ?? const ISetConst({}),
        super(key: key);

  final ISet<AccountButtonOption> _options;

  @override
  State<AccountButton> createState() => _AccountButtonState<T>();
}

class _AccountButtonState<T extends RedFireState> extends State<AccountButton> {
  final _popupKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<T, AuthUserData?>(
      distinct: true,
      converter: (store) => store.state.auth.userData,
      builder: (context, userData) {
        return Stack(
          children: [
            HiddenPopupMenuButton<T>(_popupKey, widget._options),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileAvatar(
                userData?.photoURL,
                onPressed: () => _popupKey.currentState?.showButtonMenu(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class AccountButtonOption {
  AccountButtonOption(this.name, this.callback);
  final String name;
  final Function(BuildContext) callback;
}

class HiddenPopupMenuButton<T extends RedFireState> extends StatelessWidget {
  HiddenPopupMenuButton(this._key, ISet<AccountButtonOption> options,
      {Key? key})
      : super(key: key) {
    _options = options.addAll([
      AccountButtonOption('Account Details',
          (context) => context.dispatch<T>(PushPageAction(ProfilePageData()))),
      AccountButtonOption('Sign Out',
          (BuildContext context) => context.dispatch<T>(SignOutAction()))
    ]);
  }

  final Key _key;
  late final ISet<AccountButtonOption> _options;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<AccountButtonOption>(
      key: _key,
      child: Container(color: Colors.red),
      enabled: false,
      onSelected: (option) => option.callback(context),
      itemBuilder: (context) => _options
          .map<PopupMenuEntry<AccountButtonOption>>(
              (option) => PopupMenuItem<AccountButtonOption>(
                    value: option,
                    child: Text(option.name),
                  ))
          .toList(),
    );
  }
}
