import 'contact.dart';
import 'licence.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Info-Object-2d080e5c461645a28f1a223f567f6f73

/// The object provides metadata about the API.
/// The metadata MAY be used by the clients if needed, and MAY be presented in
/// editing or documentation generation tools for convenience.
///
/// This object MAY be extended with Specification Extensions.
abstract class Info {
  /// REQUIRED. The title of the API.
  String get title;

  /// A short summary of the API.
  String get summary;

  /// A description of the API.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// A URL to the Terms of Service for the API. This MUST be in the form of a URL.
  String get termsOfService;

  /// The contact information for the exposed API.
  Contact get contact;

  /// The license information for the exposed API.
  Licence get license;

  /// REQUIRED. The version of the OpenAPI document (which is distinct from the
  /// OpenAPI Specification version or the API implementation version).
  String get version;
}
