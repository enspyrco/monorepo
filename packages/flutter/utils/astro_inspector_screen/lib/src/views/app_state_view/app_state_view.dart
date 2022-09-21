import 'package:astro_widgets/astro_widget.dart';
import 'package:flutter/material.dart';

import '../../state/inspector_state.dart';
import '../../state/viewmodels/app_state_view_view_model.dart';
import 'state_tree/key_provider.dart';
import 'state_tree/primitives/tree_controller.dart';
import 'state_tree/primitives/tree_node.dart';
import 'state_tree/widgets/tree_view.dart';

class AppStateView extends StatelessWidget {
  final _keyProvider = KeyProvider();
  final _controller = TreeController(allNodesExpanded: false);

  AppStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return StateStreamBuilder<InspectorState, AppStateViewViewModel>(
        transformer: (state) =>
            AppStateViewViewModel(state.selectedState, state.previousState),
        builder: (context, vm) {
          return Center(
            child: TreeView(
              toTreeNodes(vm.selectedAppState, vm.previousAppState),
              treeController: _controller,
            ),
          );
        });
  }

  List<TreeNode> toTreeNodes(dynamic currentJson, dynamic previousJson) {
    if (currentJson is Map<String, dynamic>) {
      return currentJson.keys
          .map(
            (k) => TreeNode(
              toTreeNodes(
                currentJson[k],
                (previousJson == null) ? null : previousJson[k],
              ),
              key: _keyProvider.nextKey(),
              content: Text('$k:'),
            ),
          ) //
          .toList();
    }
    if (currentJson is List<dynamic>) {
      return currentJson
          .asMap()
          .map(
            (i, element) => MapEntry(
              i,
              TreeNode(
                toTreeNodes(
                  element,
                  previousJson == null || previousJson.isEmpty
                      ? null
                      : previousJson.elementAt(i),
                ),
                key: _keyProvider.nextKey(),
                content: Text('[$i]:'),
              ),
            ),
          ) //
          .values
          .toList();
    }

    // Not a map or list so leaf - save a key in case we want to use it
    final key = _keyProvider.nextKey();
    final changed = currentJson != previousJson;
    if (changed) _controller.expandNode(key);
    return [
      TreeNode(
        [],
        key: key,
        content: !changed // no change -> print in black
            ? Text(currentJson.toString())
            : previousJson == null // new value was added -> show in green
                ? Text(currentJson.toString())
                : Row(
                    children: [
                      Text(previousJson.toString(), style: oldStyle),
                      const Icon(Icons.arrow_right_alt_rounded),
                      Text(currentJson.toString(), style: newStyle)
                    ],
                  ),
      ) // otherwise show difference
    ];
  }
}

final oldStyle = TextStyle(
  fontSize: 20,
  backgroundColor: Colors.red[200],
  foreground: Paint()..color = Colors.red[700]!,
  decoration: TextDecoration.lineThrough,
  decorationColor: Colors.red[700],
);

final newStyle = TextStyle(
  fontSize: 20,
  backgroundColor: Colors.green[200],
  foreground: Paint()..color = Colors.green[700]!,
);
