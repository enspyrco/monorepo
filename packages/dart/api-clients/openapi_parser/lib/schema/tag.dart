import 'external_documentation.dart';

// Spec page on Notion: https://www.notion.so/reference-material/Tag-Object-050459e88b5d41a1a6d0857edd5e2bae

/// Adds metadata to a single tag that is used by the [Operation].
/// It is not mandatory to have a Tag Object per tag defined in the Operation
/// Object instances.
///
/// This object MAY be extended with Specification Extensions.
abstract class Tag {
  /// REQUIRED. The name of the tag.
  String get name;

  /// A description for the tag.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// Additional external documentation for this tag.
  ExternalDocumentation get externalDocs;
}
