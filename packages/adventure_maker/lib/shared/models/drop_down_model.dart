import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'adventure_node.dart';

class DropDownModel<N extends AdventureNode> {
  final N? selected;
  final ISet<N> nodes;
  DropDownModel(this.selected, this.nodes);
}
