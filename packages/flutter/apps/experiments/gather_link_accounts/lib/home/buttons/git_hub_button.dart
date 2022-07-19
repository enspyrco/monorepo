import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../state/linking_state.dart';

class GitHubButton extends StatelessWidget {
  const GitHubButton({
    Key? key,
    required this.githubUri,
    required this.linkingState,
  }) : super(key: key);

  final Uri githubUri;
  final LinkingState linkingState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: ElevatedButton(
          onPressed: linkingState.disabled
              ? null
              : () async {
                  if (await canLaunchUrl(githubUri)) {
                    await launchUrl(githubUri);
                  } else {
                    throw "Could not launch $githubUri";
                  }
                },
          style: ElevatedButton.styleFrom(primary: Colors.black),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Link GitHub',
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
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
    );
  }
}
