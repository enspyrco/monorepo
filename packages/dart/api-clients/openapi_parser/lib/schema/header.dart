import 'package:openapi_parser/utils/annotations.dart';

import '../utils/types.dart';
import 'example.dart';
import 'media_type.dart';
import 'schema.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Header-Object-ae8976e9a3b44b649cf74f2e67014d4f

/// The Header Object follows the structure of the [Parameter] with the following changes:
///
/// 1. `name` MUST NOT be specified, it is given in the corresponding `headers` map.
/// 2. `in` MUST NOT be specified, it is implicitly in `header`.
/// 3. All traits that are affected by the location MUST be applicable to a location
///    of `header` (for example, [style]).
///
/// From [Parameter]: There are four possible parameter locations:
/// - path - Used together with [Path Templating], where the parameter value is
///   actually part of the operation's URL. This does not include the host or
///   base path of the API. For example, in `/items/{itemId}`, the path parameter is `itemId`.
/// - query - Parameters that are appended to the URL. For example, in `/items?id=###`,
///   the query parameter is `id`.
/// - header - Custom headers that are expected as part of the request.
///   Note that [RFC7230](https://tools.ietf.org/html/rfc7230#page-22) states
///   header names are case insensitive.
/// - cookie - Used to pass a specific cookie value to the API.
abstract class Header {
  /// A brief description of the header. This could contain examples of use.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// Determines whether this header is mandatory.
  /// If the header location is "path", this property is REQUIRED and its
  /// value MUST be true. Otherwise, the property MAY be included and its
  /// default value is false.
  @parserSettings(jsonName: 'required')
  bool get requiredField;

  /// Specifies that a header is deprecated and SHOULD be transitioned out
  /// of usage. Default value is false.
  bool get deprecated;

  /// Sets the ability to pass empty-valued headers. This is valid only for
  /// query headers and allows sending a header with an empty value.
  /// Default value is false. If [style] is used, and if behavior is n/a
  /// (cannot be serialized), the value of allowEmptyValue SHALL be ignored.
  /// Use of this property is NOT RECOMMENDED, as it is likely to be removed
  /// in a later revision.
  bool get allowEmptyValue;

  ////////////////////////////////////////////////////////////////////////////
  /// Simple Scenarios
  ///
  /// For simpler scenarios, a schema and style can describe the structure and
  /// syntax of the header.
  ////////////////////////////////////////////////////////////////////////////

  /// Describes how the header value will be serialized depending on the type
  /// of the header value. Default values (based on value of in):
  /// for query - form;
  /// for path - simple;
  /// for header - simple;
  /// for cookie - form.
  String get style;

  /// When this is true, header values of type array or object generate
  /// separate headers for each value of the array or key-value pair of the
  /// map. For other types of headers this property has no effect.
  /// When [style] is form, the default value is true. For all other styles,
  /// the default value is false.
  bool get explode;

  /// Determines whether the header value SHOULD allow reserved characters,
  /// as defined by https://tools.ietf.org/html/rfc3986#section-2.2
  /// :/?#[]@!$&'()*+,;= to be included without percent-encoding.
  /// This property only applies to headers with an in value of query.
  /// The default value is false.
  bool get allowReserved;

  /// The schema defining the type used for the header.
  Schema get schema;

  /// Example of the header's potential value. The example SHOULD match the
  /// specified schema and encoding properties if present. The example field is
  /// mutually exclusive of the examples field. Furthermore, if referencing a
  /// schema that contains an example, the example value SHALL override the
  /// example provided by the schema. To represent examples of media types that
  /// cannot naturally be represented in JSON or YAML, a string value can
  /// contain the example with escaping where necessary.
  Any get example;

  /// Examples of the header's potential value. Each example SHOULD contain a
  /// value in the correct format as specified in the header encoding. The
  /// examples field is mutually exclusive of the example field. Furthermore, if
  /// referencing a schema that contains an example, the examples value SHALL
  /// override the example provided by the schema.
  Map<String, ReferenceOr<Example>> get examples;

  ////////////////////////////////////////////////////////////////////////////
  /// More Complex Scenarios
  ///
  /// For more complex scenarios, the content property can define the media
  /// type and schema of the header.
  ////////////////////////////////////////////////////////////////////////////

  /// A map containing the representations for the header. The key is the
  /// media type and the value describes it. The map MUST only contain one entry.
  Map<String, MediaType> get content;
}
