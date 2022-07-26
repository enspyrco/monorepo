import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextButton(
        onPressed: () =>
            FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider()),
        style: TextButton.styleFrom(side: const BorderSide(width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sign In With Google',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black)),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Image.asset('assets/google32.png', height: 20),
            )
          ],
        ),
      ),
    );
  }
}
