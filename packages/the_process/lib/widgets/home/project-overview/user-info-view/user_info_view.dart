import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

import '../../../../main.dart';

class UserInfoView<T extends RedFireState> extends StatelessWidget {
  const UserInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String?>(
      distinct: true,
      converter: (store) => store.state.profile?.photoURL,
      builder: (context, photoURL) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileAvatar<AppState>(photoURL),
            ),
            const Text('User Name')
          ],
        );
      },
    );
  }
}
