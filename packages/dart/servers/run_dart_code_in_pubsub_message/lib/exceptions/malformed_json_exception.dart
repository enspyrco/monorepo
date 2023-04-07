import '../typedefs.dart';

class MalformedJsonException implements Exception {
  MalformedJsonException(this.message, this.json);

  final String message;
  final JsonMap json;

  @override
  String toString() => message;
}
