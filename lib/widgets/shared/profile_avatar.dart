import 'package:flutter/material.dart';
import 'package:the_process/actions/navigation/push_page.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/navigation/page_data/profile_page_data.dart';
import 'package:the_process/widgets/shared/checked_circle_avatar.dart';

class ProfileAvatar extends StatelessWidget {
  final String photoURL;
  const ProfileAvatar(this.photoURL, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => context.dispatch(PushPage(data: ProfilePageData())),
      elevation: 0.0,
      fillColor: Colors.white,
      child: CircleAvatar(
        radius: 17,
        backgroundColor: Color(0xffFDCF09),
        child: (photoURL == null)
            ? Icon(Icons.account_circle_outlined)
            : CheckedCircleAvatar(radius: 15, url: photoURL),
      ),
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
    );
  }
}
