import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/auth/actions/sign_out_action.dart';
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
  const AccountButton({Key? key}) : super(key: key);

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
            HiddenPopupMenuButton<T>(_popupKey),
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

enum AccountOption { signOut, edit }

class HiddenPopupMenuButton<T extends RedFireState> extends StatelessWidget {
  const HiddenPopupMenuButton(this._key, {Key? key}) : super(key: key);

  final Key _key;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<AccountOption>(
      key: _key,
      child: Container(color: Colors.red),
      enabled: false,
      onSelected: (option) {
        switch (option) {
          case AccountOption.signOut:
            {
              context.dispatch<T>(SignOutAction());
            }
            break;
          case AccountOption.edit:
            {}
            break;
        }
      },
      itemBuilder: (context) => <PopupMenuEntry<AccountOption>>[
        const PopupMenuItem<AccountOption>(
          value: AccountOption.edit,
          child: Text('Account Details'),
        ),
        const PopupMenuItem<AccountOption>(
          value: AccountOption.signOut,
          child: Text('Sign Out'),
        ),
      ],
    );
  }
}
