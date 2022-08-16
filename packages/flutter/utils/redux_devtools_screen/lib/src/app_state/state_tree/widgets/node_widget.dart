import 'package:flutter/material.dart';

import '../functions.dart';
import '../primitives/tree_controller.dart';
import '../primitives/tree_node.dart';

/// Widget that displays one [TreeNode] and its children.
class NodeWidget extends StatefulWidget {
  const NodeWidget(
    this.treeNode,
    this.state, {
    Key? key,
    this.indent = 0.0,
    this.iconSize = 18.0,
  }) : super(key: key);

  final TreeNode treeNode;
  final double indent;
  final double iconSize;
  final TreeController state;

  @override
  _NodeWidgetState createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  bool get _isExpanded => widget.state.isNodeExpanded(widget.treeNode.key);
  bool get _isLeaf => widget.treeNode.isLeaf;
  bool get _hasSingleLeafChild => widget.treeNode.hasSingleLeafChild;

  @override
  Widget build(BuildContext context) {
    final icon = _isLeaf || _hasSingleLeafChild
        ? null
        : _isExpanded
            ? Icons.arrow_drop_down
            : Icons.arrow_right;

    final onIconPressed = _isLeaf
        ? null
        : () => setState(
              () => widget.state.toggleNodeExpanded(widget.treeNode.key),
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              iconSize: widget.iconSize,
              icon: Icon(icon),
              onPressed: onIconPressed,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            GestureDetector(
              onTap: onIconPressed,
              child: widget.treeNode.content,
            ),
            if (_hasSingleLeafChild)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: widget.treeNode.children.first.content,
              )
          ],
        ),
        if (_isExpanded && !_isLeaf && !_hasSingleLeafChild)
          Padding(
            padding: EdgeInsets.only(left: widget.indent),
            child: buildNodes(
              widget.treeNode.children,
              widget.indent,
              widget.state,
              widget.iconSize,
            ),
          )
      ],
    );
  }
}
