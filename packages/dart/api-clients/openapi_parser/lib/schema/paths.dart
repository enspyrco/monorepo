import 'package:openapi_parser/schema/path_item.dart';
import 'package:openapi_parser/utils/annotations.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Paths-Object-3fac34ee53404f0f96c98cfa28a79615

/// Holds the relative paths to the individual endpoints and their operations.
/// The path is appended to the URL from the [Server] in order to construct the
/// full URL.
///
/// The Paths MAY be empty, due to Access Control List (ACL) constraints.
///
/// This object MAY be extended with Specification Extensions.
abstract class Paths {
  /// A relative path to an individual endpoint. The field name MUST begin with
  /// a forward slash (/). The path is appended (no relative URL resolution) to
  /// the expanded URL from the [Server] Object's url field in order to construct
  /// the full URL.
  ///
  /// Path templating is allowed.
  ///
  /// When matching URLs, concrete (non-templated) paths would be matched before
  /// their templated counterparts. Templated paths with the same hierarchy but
  /// different templated names MUST NOT exist as they are identical.
  ///
  /// In case of ambiguous matching, it's up to the tooling to decide which one to use.
  @parserSettings(jsonPattern: '/{path}', pattern: true)
  PathItem get pathItem;
}
