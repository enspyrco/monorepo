import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 200,
      child: Column(
        children: [
          const SizedBox(height: 50),
          TextField(
            autofocus: true,
            controller: emailController,
            decoration: const InputDecoration(hintText: 'email'),
          ),
          const SizedBox(height: 50),
          TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'password')),
          const SizedBox(height: 100),
          OutlinedButton(
              onPressed: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue, width: 1),
              ),
              child: const Text('Submit')),
        ],
      ),
    ));
  }
}
