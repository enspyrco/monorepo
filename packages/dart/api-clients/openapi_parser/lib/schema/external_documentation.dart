// Spec page in Notion: https://www.notion.so/reference-material/External-Documentation-Object-4230c556d2af4d10bf075d6e6316af54

abstract class ExternalDocumentation {
  /// A description of the target documentation.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// REQUIRED. The URL for the target documentation. This MUST be in the form of a URL.
  String get url;
}
