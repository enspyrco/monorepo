import 'package:flireator/actions/auth/sign_out.dart';
import 'package:flireator/extensions/flutter/build_context_extensions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          child: Text('Sign Out'),
          onPressed: () {
            context.dispatch(SignOut());
          },
        ),
      ),
    );
  }
}
