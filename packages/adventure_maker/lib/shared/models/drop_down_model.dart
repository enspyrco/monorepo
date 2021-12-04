import 'package:adventure_maker/shared/models/adventure_node.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class DropDownModel<N extends AdventureNode> {
  final N? selected;
  final ISet<N> nodes;
  DropDownModel(this.selected, this.nodes);
}
