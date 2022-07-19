import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        TextButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            child: const Text('Sign Out'))
      ],
    ));
  }
}
