class FileMissingInTreetWalk implements Exception {
  FileMissingInTreetWalk(this.message);
  final String message;

  @override
  String toString() =>
      'While out on a tree walk there was a missing node: $message';
}
