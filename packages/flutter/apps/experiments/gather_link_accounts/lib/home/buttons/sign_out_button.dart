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
        // style: TextButton.styleFrom(
        //     backgroundColor: const Color.fromARGB(100, 247, 221, 56)),
        child: const Text(
          'Sign out of Firebase',
          style: TextStyle(color: Colors.grey),
        ));
  }
}
