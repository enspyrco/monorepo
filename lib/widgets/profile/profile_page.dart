import 'package:flireator/actions/auth/sign_out.dart';
import 'package:flireator/extensions/flutter/build_context_extensions.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: MaterialButton(
          child: Text('Sign Out'),
          onPressed: () => context.dispatch(SignOut()),
        ),
      ),
    );
  }
}
