import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';

import '../actions/tap_domain_objects_action.dart';
import '../app_state.dart';
import '../models/class_box.dart';
import '../utils/extensions/build_context_extensions.dart';
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
            children: [
              TextButton(
                onPressed: () => context.dispatch(const SignOutAction()),
                child: const Text('clear'),
              )
            ],
          ),
        ),
        Expanded(
          child: StoreConnector<AppState, ISet<ClassBox>>(
              onInit: (store) =>
                  context.dispatch(const TapDomainObjectsAction()),
              onDispose: (store) =>
                  context.dispatch(const TapDomainObjectsAction(turnOff: true)),
              distinct: true,
              converter: (store) => store.state.classBoxes,
              builder: (context, boxes) => DrawingCanvas(boxes.unlockView)),
        ),
      ],
    );
  }
}
