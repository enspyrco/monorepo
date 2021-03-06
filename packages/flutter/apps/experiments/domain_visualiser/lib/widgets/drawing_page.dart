import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/widgets.dart';

import '../actions/tap_domain_objects_action.dart';
import '../app_state.dart';
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
                    MenuOptionPreset.accountDetails,
                    MenuOptionPreset.signOut
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: StoreConnector<AppState, ISet<ClassBox>>(
              onInit: (store) => store.dispatch(const TapDomainObjectsAction()),
              onDispose: (store) =>
                  store.dispatch(const TapDomainObjectsAction(turnOff: true)),
              distinct: true,
              converter: (store) => store.state.classBoxes,
              builder: (context, boxes) => DrawingCanvas(boxes.unlockView)),
        ),
      ],
    );
  }
}
