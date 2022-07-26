enum LinkingState {
  checking('Checking... ', true),
  notLinked('Link ', false),
  linked('You linked ', true);

  final String buttonText;
  final bool disabled;
  const LinkingState(this.buttonText, this.disabled);

  @override
  String toString() => buttonText;
}
