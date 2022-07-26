import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => FirebaseAuth.instance.signOut(),
        child: const Text(
          'Sign out',
          style: TextStyle(color: Colors.blue),
        ));
  }
}
