import 'package:flutter/widgets.dart';

import 'primitives/key_provider.dart';
import 'primitives/tree_controller.dart';
import 'primitives/tree_node.dart';
import 'widgets/node_widget.dart';

/// Builds set of [nodes] respecting [state], [indent] and [iconSize].
Widget buildNodes(
  Iterable<TreeNode> nodes,
  double indent,
  TreeController state,
  double iconSize,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var node in nodes)
        NodeWidget(
          node,
          state,
          indent: indent,
          iconSize: iconSize,
        )
    ],
  );
}

/// Copies nodes to unmodifiable list, assigning missing keys and checking for duplicates.
List<TreeNode> copyTreeNodes(List<TreeNode> nodes) {
  return _copyNodesRecursively(nodes, KeyProvider());
}

List<TreeNode> _copyNodesRecursively(
  List<TreeNode> nodes,
  KeyProvider keyProvider,
) {
  return List.unmodifiable(
    nodes.map((n) {
      return TreeNode(
        _copyNodesRecursively(n.children, keyProvider),
        key: keyProvider.key(n.key),
        content: n.content,
      );
    }),
  );
}
