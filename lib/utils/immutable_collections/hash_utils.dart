// from https://github.com/flutter/engine/blob/master/lib/ui/hash_codes.dart
class _Jenkins {
  static int combine(int hash, Object? o) {
    assert(o is! Iterable);
    hash = 0x1fffffff & (hash + o.hashCode);
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

int hashList(Iterable<Object?>? arguments) {
  var result = 0;
  if (arguments != null) {
    for (var argument in arguments) {
      result = _Jenkins.combine(result, argument);
    }
  }
  return _Jenkins.finish(result);
}
