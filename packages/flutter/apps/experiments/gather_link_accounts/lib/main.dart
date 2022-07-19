import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gather Link Accounts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                appBar: AppBar(),
                body: StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, AsyncSnapshot<User?> snapshot) {
                      if (snapshot.hasError) {
                        // handle error
                      }
                      if (snapshot.hasData) {
                        var user = snapshot.data;
                        if (user == null) {
                          return const Center(child: Text('Auth Screen'));
                        }
                        return const Center(child: Text('Home Screen'));
                      } else {
                        return Container();
                      }
                    }),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
