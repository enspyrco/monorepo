import 'package:openapi_parser/utils/annotations.dart';

import '../utils/types.dart';
import 'example.dart';
import 'media_type.dart';
import 'schema.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Parameter-Object-78e6b60c1e99485bbd559ba780f17b3c

/// Describes a single operation parameter.
/// A unique parameter is defined by a combination of a name and location.
///
/// There are four possible parameter locations specified by the `in` field:
///   - path - Used together with [Path Templating], where the parameter value
///     is actually part of the operation's URL. This does not include the host
///     or base path of the API. For example, in `/items/{itemId}`, the path
///     parameter is `itemId`.
///   - query - Parameters that are appended to the URL. For example, in
///     `/items?id=###`, the query parameter is `id`.
///   - header - Custom headers that are expected as part of the request.
///     Note that [RFC7230] states header names are case insensitive.
///   - cookie - Used to pass a specific cookie value to the API.
///
/// The rules for serialization of the parameter are specified in one of two ways.
///   - Simpler scenarios
///   - More complex scenarios
///
/// This object MAY be extended with Specification Extensions.
///
/// A parameter MUST contain either a schema property, or a content property,
/// but not both. When example or examples are provided in conjunction with the schema object,
/// the example MUST follow the prescribed serialization strategy for the parameter.
///
/// ----- Style Values -----
/// In order to support common ways of serializing simple parameters, a set of `style` values are defined.
/// | matrix | primitive, array, object | path | Path-style parameters defined by https://tools.ietf.org/html/rfc6570#section-3.2.7 |
/// | label | primitive, array, object | path | Label style parameters defined by https://tools.ietf.org/html/rfc6570#section-3.2.5 |
/// | form | primitive, array, object | query, cookie | Form style parameters defined by https://tools.ietf.org/html/rfc6570#section-3.2.8. This option replaces collectionFormat with a csv (when explode is false) or multi (when explode is true) value from OpenAPI 2.0. |
/// | simple | array | path, header | Simple style parameters defined by https://tools.ietf.org/html/rfc6570#section-3.2.2.  This option replaces collectionFormat with a csv value from OpenAPI 2.0. |
/// | spaceDelimited | array, object | query | Space separated array or object values. This option replaces collectionFormat equal to ssv from OpenAPI 2.0. |
/// | pipeDelimited | array, object | query | Pipe separated array or object values. This option replaces collectionFormat equal to pipes from OpenAPI 2.0. |
/// | deepObject | object | query | Provides a simple way of rendering nested objects using form parameters. |
abstract class Parameter {
  /// REQUIRED. The name of the parameter. Parameter names are case sensitive.
  /// - If [in] is "path", the name field MUST correspond to a template
  ///   expression occurring within the path field in the [Paths].
  ///   See Path Templating for further information.
  /// - If [in] is "header" and the name field is "Accept", "Content-Type" or
  ///   "Authorization", the parameter definition SHALL be ignored.
  /// - For all other cases, the name corresponds to the parameter name used by
  ///   the [in] property.
  String get name;

  /// REQUIRED. The location of the parameter. Possible values are "query",
  /// "header", "path" or "cookie".
  @parserSettings(jsonName: 'in')
  ParameterLocation get inField;

  /// A brief description of the parameter. This could contain examples of use.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// Determines whether this parameter is mandatory.
  /// If the parameter location is "path", this property is REQUIRED and its
  /// value MUST be true. Otherwise, the property MAY be included and its
  /// default value is false.
  @parserSettings(jsonName: 'required')
  bool get requiredField;

  /// Specifies that a parameter is deprecated and SHOULD be transitioned out
  /// of usage. Default value is false.
  bool get deprecated;

  /// Sets the ability to pass empty-valued parameters. This is valid only for
  /// query parameters and allows sending a parameter with an empty value.
  /// Default value is false. If [style] is used, and if behavior is n/a
  /// (cannot be serialized), the value of allowEmptyValue SHALL be ignored.
  /// Use of this property is NOT RECOMMENDED, as it is likely to be removed
  /// in a later revision.
  bool get allowEmptyValue;

  ////////////////////////////////////////////////////////////////////////////
  /// Simple Scenarios
  ///
  /// For simpler scenarios, a schema and style can describe the structure and
  /// syntax of the parameter.
  ////////////////////////////////////////////////////////////////////////////

  /// Describes how the parameter value will be serialized depending on the type
  /// of the parameter value. Default values (based on value of in):
  /// for query - form;
  /// for path - simple;
  /// for header - simple;
  /// for cookie - form.
  String get style;

  /// When this is true, parameter values of type array or object generate
  /// separate parameters for each value of the array or key-value pair of the
  /// map. For other types of parameters this property has no effect.
  /// When [style] is form, the default value is true. For all other styles,
  /// the default value is false.
  bool get explode;

  /// Determines whether the parameter value SHOULD allow reserved characters,
  /// as defined by https://tools.ietf.org/html/rfc3986#section-2.2
  /// :/?#[]@!$&'()*+,;= to be included without percent-encoding.
  /// This property only applies to parameters with an in value of query.
  /// The default value is false.
  bool get allowReserved;

  /// The schema defining the type used for the parameter.
  Schema get schema;

  /// Example of the parameter's potential value. The example SHOULD match the
  /// specified schema and encoding properties if present. The example field is
  /// mutually exclusive of the examples field. Furthermore, if referencing a
  /// schema that contains an example, the example value SHALL override the
  /// example provided by the schema. To represent examples of media types that
  /// cannot naturally be represented in JSON or YAML, a string value can
  /// contain the example with escaping where necessary.
  Any get example;

  /// Examples of the parameter's potential value. Each example SHOULD contain a
  /// value in the correct format as specified in the parameter encoding. The
  /// examples field is mutually exclusive of the example field. Furthermore, if
  /// referencing a schema that contains an example, the examples value SHALL
  /// override the example provided by the schema.
  Map<String, ReferenceOr<Example>> get examples;

  ////////////////////////////////////////////////////////////////////////////
  /// More Complex Scenarios
  ///
  /// For more complex scenarios, the content property can define the media
  /// type and schema of the parameter.
  ////////////////////////////////////////////////////////////////////////////

  /// A map containing the representations for the parameter. The key is the
  /// media type and the value describes it. The map MUST only contain one entry.
  Map<String, MediaType> get content;
}

/// [Parameter] has a required field - the location of the parameter, with
/// possible values "query", "header", "path" or "cookie".
enum ParameterLocation {
  query,
  header,
  path,
  cookie;
}
