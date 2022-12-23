// Spec page in Notion: https://www.notion.so/reference-material/License-Object-d288968a218a42bb84f8383ad77d897b

/// License information for the exposed API.
///
/// This object MAY be extended with Specification Extensions.
abstract class Licence {
  /// REQUIRED. The license name used for the API.
  String get name;

  /// An SPDX (https://spdx.org/spdx-specification-21-web-version#h.jxpfx0ykyb60)
  /// license expression for the API. The identifier field is mutually exclusive
  /// of the url field.
  String get identifier;

  /// A URL to the license used for the API. This MUST be in the form of a URL.
  /// The url field is mutually exclusive of the identifier field.
  String get url;
}
