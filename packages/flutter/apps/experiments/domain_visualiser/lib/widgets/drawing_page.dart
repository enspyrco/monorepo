import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:flutter/material.dart';

import '../app/state/app_state.dart';
import '../missions/tap_domain_objects.dart';
import '../models/class_box.dart';
import 'drawing_canvas.dart';

class DrawingPage extends StatelessWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Material(
                child: AvatarMenuButton<AppState>(
                  options: {
                    MenuOption('Sign Out', SignOut()),
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: OnStateChangeBuilder<AppState, Set<ClassBox>>(
              onInit: (store) => store.launch(const TapDomainObjects()),
              onDispose: (store) =>
                  store.launch(const TapDomainObjects(turnOff: true)),
              transformer: (state) => state.classBoxes,
              builder: (context, boxes) => DrawingCanvas(boxes)),
        ),
      ],
    );
  }
}
