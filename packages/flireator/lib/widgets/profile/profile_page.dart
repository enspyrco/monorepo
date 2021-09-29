import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

import '../../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthUserData?>(
        distinct: true,
        converter: (store) => store.state.auth.userData,
        builder: (context, userData) {
          return Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(
                    color: Colors.black, //change your color here
                  ),
                  actions: [
                const HiddenAccountButtonForPopup(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileAvatar(userData?.photoURL, onPressed: () {})),
              ]));
        });
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class HiddenAccountButtonForPopup extends StatelessWidget {
  const HiddenAccountButtonForPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WhyFarther>(
      child: Container(),
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


// class AccountButton extends StatelessWidget {
//   const AccountButton({
//     required String? photoUrl,
//     Key? key,
//   })  : _photoUrl = photoUrl,
//         super(key: key);

//   final String? _photoUrl;
//   final _overlayEntry =
//       OverlayEntry(builder: (context) => const FloatingMenu());

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ProfileAvatar(_photoUrl, onPressed: () {
//         Overlay.of(context)?.insert();
//         // context.dispatch(NavigateToProfileAction());
//       }),
//     );
//   }
// }

// class FloatingMenu extends StatelessWidget {
//   const FloatingMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       right: 10,
//       top: 10,
//       child: SizedBox(
//         width: 150,
//         child: Material(
//           child: ListView(
//             shrinkWrap: true,
//             children: [
//               MaterialButton(
//                   onPressed: () => context.dispatch<AppState>(SignOutAction()),
//                   child: const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text('Sign Out'))),
//               MaterialButton(
//                 onPressed: () {},
//                 child: const Align(
//                     alignment: Alignment.centerLeft, child: Text('Cancel')),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
