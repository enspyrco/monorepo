import '../utils/annotations.dart';
import '../utils/types.dart';
import 'operation.dart';
import 'parameter.dart';
import 'server.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Path-Item-Object-b70069f94e394c379fc2779fb1e0ebe8

/// Describes the operations available on a single path.
/// A Path Item MAY be empty, due to ACL constraints.
/// The path itself is still exposed to the documentation viewer but they will
/// not know which operations and parameters are available.
///
/// This object MAY be extended with Specification Extensions.
abstract class PathItem {
  /// Allows for a referenced definition of this path item. The referenced
  /// structure MUST be in the form of a [PathItem].  In case a PathItem
  /// field appears both in the defined object and the referenced object, the
  /// behavior is undefined. See the rules for resolving Relative References.
  @parserSettings(jsonName: r'$ref')
  String get ref;

  /// An optional, string summary, intended to apply to all operations in this path.
  String get summary;

  /// An optional, string description, intended to apply to all operations in
  /// this path. https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// A definition of a GET operation on this path.
  Operation get get;

  /// A definition of a PUT operation on this path.
  Operation get put;

  /// A definition of a POST operation on this path.
  Operation get post;

  /// A definition of a DELETE operation on this path.
  Operation get delete;

  /// A definition of a OPTIONS operation on this path.
  Operation get options;

  /// A definition of a HEAD operation on this path.
  Operation get head;

  /// A definition of a PATCH operation on this path.
  Operation get patch;

  /// A definition of a TRACE operation on this path.
  Operation get trace;

  /// An alternative server array to service all operations in this path.
  List<Server> get servers;

  /// A list of parameters that are applicable for all the operations described
  /// under this path. These parameters can be overridden at the operation level,
  /// but cannot be removed there. The list MUST NOT include duplicated parameters.
  /// A unique parameter is defined by a combination of a name and location.
  /// The list can use the [Reference] to link to parameters that are defined at
  /// the OpenAPI Object's components/parameters.
  List<ReferenceOr<Parameter>> get parameters;
}
