// Spec page in Notion: https://www.notion.so/reference-material/Contact-Object-e5998253f7c44f13a66c26278d3e1759

/// Contact information for the exposed API.
///
/// This object MAY be extended with Specification Extensions.
abstract class Contact {
  /// The identifying name of the contact person/organization.
  String get name;

  /// The URL pointing to the contact information.
  /// This MUST be in the form of a URL.
  String get url;

  /// The email address of the contact person/organization.
  /// This MUST be in the form of an email address.
  String get email;
}
