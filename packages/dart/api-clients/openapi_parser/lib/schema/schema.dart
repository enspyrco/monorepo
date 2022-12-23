import '../utils/types.dart';
import 'discriminator.dart';
import 'external_documentation.dart';
import 'x_m_l.dart';

// Spec page in Notion:

/// The Schema Object allows the definition of input and output data types.
/// These types can be objects, but also primitives and arrays. This object is
/// a superset of the JSON Schema Specification Draft 2020-12.
///
/// For more information about the properties, see JSON Schema Core and JSON Schema Validation.
///
/// Unless stated otherwise, the property definitions follow those of JSON Schema
/// and do not add any additional semantics.
/// Where JSON Schema indicates that behavior is defined by the application
/// (e.g. for annotations), OAS also defers the definition of semantics to the
/// application consuming the OpenAPI document.
///
/// This object MAY be extended with Specification Extensions, though as noted,
/// additional properties MAY omit the x- prefix within this object.
abstract class Schema {
  /// Adds support for polymorphism. The discriminator is an object name that is
  /// used to differentiate between other schemas which may satisfy the payload
  /// description. See Spec > Schema > Schema Object > Composition & Inheritance
  /// for more details.
  Discriminator get discriminator;

  /// This MAY be used only on properties schemas. It has no effect on root schemas.
  /// Adds additional metadata to describe the XML representation of this property.
  XML get xml;

  /// Additional external documentation for this schema.
  ExternalDocumentation get externalDocs;

  /// A free-form property to include an example of an instance for this schema.
  /// To represent examples that cannot be naturally represented in JSON or YAML,
  /// a string value can be used to contain the example with escaping where necessary.
  ///
  /// Deprecated: The example property has been deprecated in favor of the JSON
  /// Schema examples keyword. Use of example is discouraged, and later versions
  /// of this specification may remove it.
  Any get example;
}
