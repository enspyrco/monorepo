import 'package:the_process/utils/immutable_collections/immutable_list.dart';

extension ListExtension<T> on List<T> {
  ImmutableList<T> toImmutableList() => ImmutableList<T>.fromList(this);
}
