import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/widgets/shared/profile_avatar.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String?>(
      distinct: true,
      converter: (store) => store.state.profileData?.photoURL,
      builder: (context, photoURL) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileAvatar(photoURL),
            ),
            const Text('User Name')
          ],
        );
      },
    );
  }
}
