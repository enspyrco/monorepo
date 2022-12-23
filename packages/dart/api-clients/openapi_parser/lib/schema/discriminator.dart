// Spec page in Notion: https://www.notion.so/reference-material/Discriminator-Object-930af9b08f6c4bff916bf389e51e5c6e

/// When request bodies or response payloads may be one of a number of different
/// schemas, a `discriminator` object can be used to aid in serialization,
/// deserialization, and validation.  The discriminator is a specific object in
/// a schema which is used to inform the consumer of the document of an alternative
/// schema based on the value associated with it.
///
/// When using the discriminator, *inline* schemas will not be considered.
///
/// This object MAY be extended with Specification Extensions.
abstract class Discriminator {
  /// REQUIRED. The name of the property in the payload that will hold the discriminator value.
  String get propertyName;

  /// An object to hold mappings between payload values and schema names or references.
  Map<String, String> get mapping;
}
