import '../utils/types.dart';
import 'encoding.dart';
import 'example.dart';
import 'schema.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Media-Type-Object-5e4b3a45e7dc42a6b403ddd67c67c03d

/// Each Media Type Object provides schema and examples for the media type
/// identified by its key.
///
/// This object MAY be extended with Specification Extensions.
abstract class MediaType {
  /// The schema defining the content of the request, response, or parameter.
  Schema get schema;

  /// Example of the media type.  The example object SHOULD be in the correct
  /// format as specified by the media type.  The example field is mutually
  /// exclusive of the examples field.  Furthermore, if referencing a schema
  /// which contains an example, the example value SHALL override the example
  /// provided by the schema.
  Any get example;

  /// Examples of the media type.  Each example object SHOULD  match the media
  /// type and specified schema if present.  The examples field is mutually
  /// exclusive of the example field.  Furthermore, if referencing a schema
  /// which contains an example, the examples value SHALL override the example
  /// provided by the schema.
  Map<String, ReferenceOr<Example>> get examples;

  /// A map between a property name and its encoding information. The key, being
  /// the property name, MUST exist in the schema as a property. The encoding
  /// object SHALL only apply to requestBody objects when the media type is
  /// multipart or application/x-www-form-urlencoded.
  Map<String, Encoding> get encoding;
}
