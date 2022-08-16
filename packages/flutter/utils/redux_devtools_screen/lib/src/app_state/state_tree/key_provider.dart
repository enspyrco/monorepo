import 'package:flutter/foundation.dart';

class KeyProvider {
  int count = 0;

  Key nextKey() => Key('${count++}');
}
