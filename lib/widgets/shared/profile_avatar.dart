import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String photoURL;
  final void Function()? onPressed;
  const ProfileAvatar(
    this.photoURL, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: Colors.white,
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
      child: CircleAvatar(
        radius: 17,
        backgroundColor: Color(0xffFDCF09),
        child:
            CircleAvatar(radius: 15, backgroundImage: NetworkImage(photoURL)),
      ),
    );
  }
}
