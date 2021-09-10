import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class PresentSet {
  final ISet<String> _ids;
  PresentSet(this._ids);
  Map<String, Object?> toJson() =>
      {'type': 'present_set', 'ids': _ids.toList()};
}
