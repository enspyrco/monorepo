import 'package:flutter/material.dart';

import '../../../actions.dart';
import '../../../types.dart';
import '../../redux/extensions/build_context_extensions.dart';
import 'checked_circle_avatar.dart';

class ProfileAvatar<T extends RedFireState> extends StatelessWidget {
  final String? photoURL;
  final void Function()? onPressed;
  const ProfileAvatar(this.photoURL, {this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localPhotoURL = photoURL; // gimme that flow analysis
    return RawMaterialButton(
      onPressed: onPressed ??
          () => context.dispatch<T>(const PushPageAction(ProfilePageData())),
      elevation: 0.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(5.0),
      shape: const CircleBorder(),
      child: CircleAvatar(
        radius: 17,
        backgroundColor: const Color(0xffFDCF09),
        child: (localPhotoURL == null)
            ? const Icon(Icons.account_circle_outlined)
            : CheckedCircleAvatar(radius: 15, url: localPhotoURL),
      ),
    );
  }
}
