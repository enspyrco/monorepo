import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../state/linking_state.dart';
import '../utils/utils.dart';
import 'buttons/gather_button.dart';
import 'buttons/git_hub_button.dart';
import 'buttons/sign_out_button.dart';

typedef JsonMap = Map<String, Object?>;
typedef DocSnapshot = DocumentSnapshot<JsonMap>;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String nonce;
  late final Uri gatherUri;
  late final Future<void> setNonceFuture;
  late final Stream<DocumentSnapshot<JsonMap>> docStream;
  LinkingState linkingState = LinkingState.checking;

  @override
  void initState() {
    super.initState();
    nonce = Utils.generateNonce();
    var gatherRedirect = Uri.encodeComponent(
        'https://gather-link-account-shelf-eogj3aa7na-uc.a.run.app/gather/?nonce=$nonce&');
    gatherUri =
        Uri.parse('https://gather.town/getPublicId?redirectTo=$gatherRedirect');
    setNonceFuture = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'gathernonce': nonce}, SetOptions(merge: true));
    docStream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocSnapshot>(
        stream: docStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            JsonMap docJson = snapshot.data!.data()!;
            if (docJson['gather'] != null) {
              linkingState = LinkingState.linked;
            } else {
              linkingState = LinkingState.waiting;
            }
          } else {
            return const CircularProgressIndicator();
          }
          return Center(
              child: Column(
            children: [
              const SizedBox(height: 100),
              GatherButton(gatherUri: gatherUri, linkingState: linkingState),
              const SizedBox(height: 100),
              const GitHubButton(),
              const SizedBox(height: 100),
              const SignOutButton(),
            ],
          ));
        });
  }
}
