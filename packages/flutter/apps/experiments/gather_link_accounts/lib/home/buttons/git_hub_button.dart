import 'package:flutter/material.dart';

class GitHubButton extends StatelessWidget {
  const GitHubButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
          onPressed: () {},
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
