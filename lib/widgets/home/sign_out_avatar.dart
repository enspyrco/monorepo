import 'package:flireator/actions/navigation/navigate_to_profile.dart';
import 'package:flireator/extensions/flutter/build_context_extensions.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/models/flireator/flireator.dart';
import 'package:flireator/widgets/shared/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SignOutAvatar extends StatelessWidget {
  const SignOutAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Flireator>(
      distinct: true,
      converter: (store) => store.state.flireator,
      builder: (context, flireator) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProfileAvatar(flireator?.photoURL, onPressed: () {
            context.dispatch(NavigateToProfile());
          }),
        );
      },
    );
  }
}
