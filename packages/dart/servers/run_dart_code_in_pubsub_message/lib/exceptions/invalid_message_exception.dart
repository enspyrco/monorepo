class InvalidMessageContentException {
  InvalidMessageContentException(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}
