import 'package:fast_immutable_collections/fast_immutable_collections.dart';

abstract class AdventureSubtree<M> {
  ISet<M> get list;
  M? get selected;
}
