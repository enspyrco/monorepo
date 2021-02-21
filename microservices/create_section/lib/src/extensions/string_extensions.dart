import 'package:googleapis/firestore/v1.dart';

extension StringExtension on String {
  Value asValue() => Value()..stringValue = this;
}
