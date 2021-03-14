import 'package:immutable_collections/immutable_collections.dart';

extension ListExtension<T> on List<T> {
  ImmutableList<T> toImmutableList() => ImmutableList<T>.from(this);
}
