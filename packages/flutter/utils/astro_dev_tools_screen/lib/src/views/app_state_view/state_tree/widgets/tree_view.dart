import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../functions.dart';
import '../primitives/tree_controller.dart';
import '../primitives/tree_node.dart';

/// Tree view with collapsible and expandable nodes.
class TreeView extends StatefulWidget {
  TreeView(
    List<TreeNode> nodes, {
    Key? key,
    this.indent = 40.0,
    this.iconSize = 18.0,
    this.treeController,
  })  : nodes = copyTreeNodes(nodes),
        super(key: key);

  /// List of root level tree nodes.
  final List<TreeNode> nodes;

  /// Horizontal indent between levels.
  final double indent;

  /// Size of the expand/collapse icon.
  final double iconSize;

  /// Tree controller to manage the tree state.
  final TreeController? treeController;

  @override
  _TreeViewState createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  late TreeController _controller;

  @override
  void initState() {
    _controller = widget.treeController ?? TreeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildNodes(
      widget.nodes,
      widget.indent,
      _controller,
      widget.iconSize,
    );
  }
}
