import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gather_link_accounts/auth/auth_screen.dart';

import 'firebase_options.dart';
import 'home/home_screen.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gather Link Accounts',
      home: AuthGuard(),
    );
  }
}

class AuthGuard extends StatefulWidget {
  const AuthGuard({Key? key}) : super(key: key);

  @override
  State<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  StreamSubscription<User?>? subscription;
  bool signedIn = false;

  @override
  void initState() {
    super.initState();
    subscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (!mounted) return;
      setState(() => signedIn = user != null);
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: signedIn ? const HomeScreen() : const AuthScreen(),
      ),
    );
  }
}
