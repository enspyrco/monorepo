import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../state/linking_state.dart';

class GatherButton extends StatelessWidget {
  const GatherButton({
    Key? key,
    required this.gatherUri,
    required this.linkingState,
  }) : super(key: key);

  final Uri gatherUri;
  final LinkingState linkingState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: ElevatedButton(
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
            Text(
              linkingState.buttonText,
              style: const TextStyle(
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
          ],
        ),
      ),
    );
  }
}
