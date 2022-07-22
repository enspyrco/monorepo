import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gather_link_accounts/auth/buttons/google_sign_in_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var enabled = true;
  var errorText = '';

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
      width: 210,
      child: Column(
        children: [
          const SizedBox(height: 50),
          const GoogleSignInButton(),
          const SizedBox(height: 50),
          TextField(
            autofocus: true,
            controller: emailController,
            decoration: const InputDecoration(hintText: 'email'),
            enabled: enabled,
          ),
          const SizedBox(height: 50),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'password'),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            enabled: enabled,
          ),
          const SizedBox(height: 50),
          Text(errorText),
          const SizedBox(height: 50),
          (enabled)
              ? Row(
                  children: [
                    OutlinedButton(
                        onPressed: () async {
                          setState(() {
                            errorText = '';
                            enabled = false;
                          });
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                          } on FirebaseAuthException catch (error) {
                            setState(() {
                              errorText = error.message ?? '?';
                              enabled = true;
                            });
                          } catch (error) {
                            setState(() {
                              errorText = error.toString();
                              enabled = true;
                            });
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue, width: 1),
                        ),
                        child: const Text('Login')),
                    const SizedBox(width: 20),
                    const Text('OR'),
                    const SizedBox(width: 20),
                    OutlinedButton(
                        onPressed: () async {
                          setState(() {
                            errorText = '';
                            enabled = false;
                          });
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                          } on FirebaseAuthException catch (error) {
                            setState(() {
                              errorText = error.message ?? '?';
                              enabled = true;
                            });
                          } catch (error) {
                            setState(() {
                              errorText = error.toString();
                              enabled = true;
                            });
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue, width: 1),
                        ),
                        child: const Text('Create')),
                  ],
                )
              : const CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
