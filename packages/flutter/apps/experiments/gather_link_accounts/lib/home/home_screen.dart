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
  late final String gatherNonce, githubNonce;
  late final Uri gatherUri, githubUri;
  late final Future<void> setNonceFuture;
  late final Stream<DocumentSnapshot<JsonMap>> docStream;
  LinkingState gatherState = LinkingState.checking;
  LinkingState githubState = LinkingState.checking;
  final finishedText =
      'Your accounts have been linked!\n\nYou can now close this window and will\n'
      'soon be teleported into the first adventure...';

  @override
  void initState() {
    super.initState();
    gatherNonce = Utils.generateNonce();
    githubNonce = Utils.generateNonce();
    var gatherRedirect = Uri.encodeComponent(
        'https://gather-link-account-shelf-eogj3aa7na-uc.a.run.app/gather/?nonce=$gatherNonce&');
    gatherUri =
        Uri.parse('https://gather.town/getPublicId?redirectTo=$gatherRedirect');
    githubUri = Uri.parse(
        'https://github.com/login/oauth/authorize?client_id=3b2457d371c7b9b4a1b8&state=$githubNonce');
    setNonceFuture = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'gathernonce': gatherNonce, 'githubnonce': githubNonce},
            SetOptions(merge: true));
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
          print('$gatherState, $githubState');
          if (snapshot.hasData && snapshot.data!.exists) {
            JsonMap docJson = snapshot.data!.data()!;
            gatherState = (docJson['gather'] == null)
                ? gatherState = LinkingState.notLinked
                : gatherState = LinkingState.linked;
            githubState = (docJson['github'] == null)
                ? githubState = LinkingState.notLinked
                : githubState = LinkingState.linked;
          } else {
            return const CircularProgressIndicator();
          }
          return Center(
              child: Column(
            children: [
              if (githubState == LinkingState.linked &&
                  gatherState == LinkingState.linked) ...[
                const SizedBox(height: 100),
                Text(finishedText),
              ],
              const SizedBox(height: 100),
              GatherButton(gatherUri: gatherUri, linkingState: gatherState),
              if (githubState != LinkingState.linked ||
                  gatherState != LinkingState.linked)
                const SizedBox(height: 100),
              GitHubButton(githubUri: githubUri, linkingState: githubState),
              const SizedBox(height: 150),
              SizedBox(
                  width: 230,
                  child: Row(children: const [
                    SignOutButton(),
                    Text('if you would like to start')
                  ])),
              const SizedBox(
                width: 300,
                child: Text('             again and use a different account.'),
              )
            ],
          ));
        });
  }
}
