import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String nonce;
  late final Uri gatherUri;

  @override
  void initState() {
    super.initState();
    nonce = Utils.generateNonce();
    var gatherRedirect = Uri.encodeComponent(
        'https://gather-link-account-shelf-eogj3aa7na-uc.a.run.app/gather/?nonce=$nonce&');
    gatherUri =
        Uri.parse('https://gather.town/getPublicId?redirectTo=$gatherRedirect');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(height: 100),
        SizedBox(
          width: 150,
          child: FutureBuilder<void>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set({'gathernonce': nonce}, SetOptions(merge: true)),
              builder: (context, snapshot) {
                return ElevatedButton(
                    onPressed: () async {
                      if (await canLaunchUrl(gatherUri)) {
                        await launchUrl(gatherUri);
                      } else {
                        throw "Could not launch $gatherUri";
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Link Gather',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(200, 5, 73, 255)),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Image.asset(
                              'assets/gather32.png',
                              height: 20,
                            ),
                          )
                        ]));
              }),
        ),
        const SizedBox(height: 100),
        SizedBox(
          width: 150,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Link GitHub',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Image.asset(
                        'assets/github32.png',
                        height: 20,
                      ),
                    )
                  ])),
        ),
        const SizedBox(height: 100),
        TextButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(100, 247, 221, 56)),
            child: const Text(
              'Sign out of Firebase',
              style: TextStyle(color: Colors.grey),
            )),
      ],
    ));
  }
}
