import 'package:flutter/material.dart';
import 'package:the_process/actions/navigation/push_page_action.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/widgets/shared/checked_circle_avatar.dart';

class ProfileAvatar extends StatelessWidget {
  final String? photoURL;
  const ProfileAvatar(this.photoURL, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localPhotoURL = photoURL; // gimme that flow analysis
    return RawMaterialButton(
      onPressed: () =>
          context.dispatch(PushPageAction(data: const ProfilePageData())),
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
