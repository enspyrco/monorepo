import 'package:openapi_parser/utils/annotations.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Reference-Object-729cb68fba6a484cb07df2af2e8d4018

/// A simple object to allow referencing other components in the OpenAPI document,
/// internally and externally.
///
/// The `$ref` string value contains a URI [RFC3986](https://tools.ietf.org/html/rfc3986),
/// which identifies the location of the value being referenced.
///
/// See the rules for resolving [Relative References].
///
/// This object cannot be extended with additional properties and any properties
/// added SHALL be ignored.
///
/// Note that this restriction on additional properties is a difference between
/// [Reference] Objects and [Schema] Objects that contain a `$ref` keyword.
abstract class Reference {
  /// REQUIRED. The reference identifier. This MUST be in the form of a URI.
  @parserSettings(jsonName: r'$ref')
  String get ref;

  /// A short summary which by default SHOULD override that of the referenced
  /// component. If the referenced object-type does not allow a summary field,
  /// then this field has no effect.
  String get summary;

  /// A description which by default SHOULD override that of the referenced component.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  /// If the referenced object-type does not allow a description field, then this
  /// field has no effect.
  String get description;
}
