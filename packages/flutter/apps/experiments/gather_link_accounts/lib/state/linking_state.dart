enum LinkingState {
  checking('Checking...'),
  waiting('Link Gather'),
  linked('Gather is linked');

  final String buttonText;
  const LinkingState(this.buttonText);

  @override
  String toString() => buttonText;
}
