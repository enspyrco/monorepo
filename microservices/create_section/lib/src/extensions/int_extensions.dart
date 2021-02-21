import 'package:googleapis/firestore/v1.dart';

extension IntExtension on int {
  Value asValue() => Value()..integerValue = toString();
}
