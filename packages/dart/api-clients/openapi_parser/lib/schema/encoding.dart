import '../utils/types.dart';
import 'header.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Encoding-Object-266375963628453f8fba8cb1e52a436c

/// A single encoding definition applied to a single schema property.
///
/// This object MAY be extended with Specification Extensions.
abstract class Encoding {
  /// The Content-Type for encoding a specific property. Default value depends
  /// on the property type:
  /// for object - application/json;
  /// for array – the default is defined based on the inner type
  /// for all other cases the default is application/octet-stream.
  /// The value can be a specific media type (e.g. application/json), a wildcard
  /// media type (e.g. image/*), or a comma-separated list of the two types.
  String get contentType;

  /// A map allowing additional information to be provided as headers, for
  /// example Content-Disposition.
  /// Content-Type is described separately and SHALL be ignored in this section.
  /// This property SHALL be ignored if the request body media type is not a multipart.
  Map<String, ReferenceOr<Header>> get headers;

  /// Describes how a specific property value will be serialized depending on
  /// its type.
  /// See [Parameter] for details on the [style] property. The behavior follows
  /// the same values as query parameters, including default values. This
  /// property SHALL be ignored if the request body media type is not
  /// application/x-www-form-urlencoded or multipart/form-data. If a value is
  /// explicitly defined, then the value of [contentType] (implicit or explicit)
  /// SHALL be ignored.
  String get style;

  /// When this is true, property values of type array or object generate separate
  /// parameters for each value of the array, or key-value-pair of the map.
  /// For other types of properties this property has no effect. When [style] is
  /// form, the default value is true. For all other styles, the default value
  /// is false. This property SHALL be ignored if the request body media type is
  /// not application/x-www-form-urlencoded or multipart/form-data. If a value
  /// is explicitly defined, then the value of [contentType] (implicit or explicit)
  /// SHALL be ignored.
  bool get explode;

  /// Determines whether the parameter value SHOULD allow reserved characters,

  /// as defined by https://tools.ietf.org/html/rfc3986#section-2.2
  /// :/?#[]@!$&'()*+,;= to be included without percent-encoding. The default
  /// value is false. This property SHALL be ignored if the request body media
  /// type is not application/x-www-form-urlencoded or multipart/form-data.
  /// If a value is explicitly defined, then the value of [contentType]
  /// (implicit or explicit) SHALL be ignored.
  bool get allowReserved;
}
