import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gather_link_accounts/auth/auth_screen.dart';

import 'firebase_options.dart';
import 'home/home_screen.dart';

void main() {
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

class AuthGuard extends StatelessWidget {
  const AuthGuard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, AsyncSnapshot<FirebaseApp> snapshot) {
            if (snapshot.hasError) {
              // handle error
            }
            if (snapshot.hasData) {
              return Scaffold(
                // appBar: AppBar(),
                body: StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, AsyncSnapshot<User?> snapshot) {
                      if (snapshot.hasError) {
                        // handle error
                      }
                      var user = snapshot.data;
                      if (user == null) {
                        return const AuthScreen();
                      }
                      return const HomeScreen();
                    }),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
