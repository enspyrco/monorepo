import 'package:flutter/widgets.dart';

class TreeNode {
  TreeNode(this.children, {required this.key, Widget? content})
      : content = content ?? const SizedBox(width: 0, height: 0);

  final Key key;
  final List<TreeNode> children;
  final Widget content;

  bool get isLeaf => children.isEmpty;
  bool get hasSingleLeafChild => children.length == 1 && children.first.isLeaf;
}
