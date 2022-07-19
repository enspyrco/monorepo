enum LinkingState {
  checking('Checking...', true),
  waiting('Link Gather', false),
  linked('Gather is linked', true);

  final String buttonText;
  final bool disabled;
  const LinkingState(this.buttonText, this.disabled);

  @override
  String toString() => buttonText;
}
