import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
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
                MaterialButton(
                  onPressed: () => context.dispatch<AppState>(SignOutAction()),
                  child: const Text('Sign Out'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileAvatar(userData?.photoURL, onPressed: () {
                    // context.dispatch(NavigateToProfileAction());
                  }),
                )
              ]));
        });
  }
}
