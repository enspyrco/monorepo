// ignore: camel_case_types
class parserSettings {
  const parserSettings({
    this.jsonName,
    this.jsonPattern,
    this.pattern = false,
  });
  final String? jsonName;
  final String? jsonPattern;
  final bool pattern;
}

// const parserSettings = ParserSettingsAnnotation();
