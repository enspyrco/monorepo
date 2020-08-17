import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String photoURL;
  final Function onPressed;
  const ProfileAvatar(
    this.photoURL, {
    @required this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: Colors.white,
      child: CircleAvatar(
        radius: 17,
        backgroundColor: Color(0xffFDCF09),
        child: CircleAvatar(
          radius: 15,
          backgroundImage: (photoURL != null)
              ? NetworkImage(photoURL)
              : NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
        ),
      ),
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
    );
  }
}
