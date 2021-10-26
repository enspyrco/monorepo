import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:redfire/src/auth/constants/auth_provider_names.dart';
import 'package:redfire/src/auth/enums/providers_enum.dart';
import 'package:redfire/src/auth/link-providers/actions/link_account_action.dart';
import 'package:redfire/src/auth/link-providers/enums/linking_account_enum.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/types.dart';

import './client_secret.dart' as client_secret;

class LinkProviderButton<T extends RedFireState> extends StatelessWidget {
  const LinkProviderButton(
      ProvidersEnum provider, LinkingStateEnum linkingState,
      {Key? key})
      : _provider = provider,
        _linkingState = linkingState,
        super(key: key);

  final ProvidersEnum _provider;
  final LinkingStateEnum _linkingState;

  @override
  Widget build(BuildContext context) {
    return (_linkingState == LinkingStateEnum.linking)
        ? const CircularProgressIndicator()
        : IconButton(
            onPressed: (_linkingState == LinkingStateEnum.linked)
                ? null
                : () {
                    if (_provider == ProvidersEnum.gitHub) {
                      linkGitHub(context);
                    }
                    context.dispatch<T>(LinkAccountAction(_provider));
                  },
            icon: Icon(authProviderIconFrom[_provider]));
  }

  Future<UserCredential> linkGitHub(BuildContext context) async {
    // Create a GitHubSignIn instance
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: '22a49e78abd4b732a091',
        clientSecret: client_secret.value,
        redirectUrl:
            'https://tech-world-project.firebaseapp.com/__/auth/handler');

    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);

    // Create a credential from the access token
    final githubAuthCredential = GithubAuthProvider.credential(result.token!);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.currentUser!
        .linkWithCredential(githubAuthCredential);
  }
}
