import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/profile/widgets/profile_avatar.dart';
import 'package:redfire/types.dart';

/// A [StatefulWidget] so that we can keep the global key [_popupKey] as state.
///
/// [_popupKey] is passed in to both the hidden button and the displayed button
/// so that the hidden button's menu can be popped by the displayed button.
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
            HiddenPopupMenuButton(_popupKey),
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

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class HiddenPopupMenuButton extends StatelessWidget {
  const HiddenPopupMenuButton(this._key, {Key? key}) : super(key: key);

  final Key _key;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WhyFarther>(
      key: _key,
      child: Container(color: Colors.red),
      enabled: false,
      onSelected: (WhyFarther result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.harder,
          child: Text('Working a lot harder'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.smarter,
          child: Text('Being a lot smarter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.selfStarter,
          child: Text('Being a self-starter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.tradingCharter,
          child: Text('Placed in charge of trading charter'),
        ),
      ],
    );
  }
}
