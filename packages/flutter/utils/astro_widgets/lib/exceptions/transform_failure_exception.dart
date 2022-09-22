/// Thrown when the StateStreamBuilder encounters a problem while
/// running the [StateStreamBuilder.transform] function.
class TransformFailureException implements Exception {
  final Object exception;
  final StackTrace trace;
  TransformFailureException(this.exception, this.trace);

  @override
  String toString() {
    return '''Transform Function Error: If the transform function passed
to the StateStreamBuilder throws when applied, we wrap what was thrown in a
TransformFailureException. Below is what was originally thrown:

$exception
    
$trace

''';
  }
}
