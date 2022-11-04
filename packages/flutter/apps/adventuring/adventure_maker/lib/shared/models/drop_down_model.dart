import 'adventure_node.dart';

class DropDownModel<N extends AdventureNode> {
  final N? selected;
  final Set<N> nodes;
  DropDownModel(this.selected, this.nodes);
}
