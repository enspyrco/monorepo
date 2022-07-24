class TestException implements Exception {
  final String message;
  const TestException(this.message);
  @override
  String toString() => 'TestException: $message';
}
