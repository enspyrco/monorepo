import '../utils/types.dart';
import 'callback.dart';
import 'example.dart';
import 'header.dart';
import 'link.dart';
import 'parameter.dart';
import 'path_item.dart';
import 'request_body.dart';
import 'response.dart';
import 'schema.dart';
import 'security_scheme.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Components-Object-1fc0826ec77f4c0e96eeab4048cdbede

/// Holds a set of reusable objects for different aspects of the OAS.
/// All objects defined within the components object will have no effect on the
/// API unless they are explicitly referenced from properties outside the
/// components object.
///
/// This object MAY be extended with Specification Extensions.
/// All the fixed fields are objects that MUST use keys that match the regular
/// expression: `^[a-zA-Z0-9\\.\\-_]+$`.
///
/// This object MAY be extended with Specification Extensions.
abstract class Components {
  /// An object to hold reusable [Schema].
  Map<String, Schema> get schemas;

  /// An object to hold reusable [Response].
  Map<String, ReferenceOr<Response>> get responses;

  /// An object to hold reusable [Parameter].
  Map<String, ReferenceOr<Parameter>> get parameters;

  /// An object to hold reusable [Example].
  Map<String, ReferenceOr<Example>> get examples;

  /// An object to hold reusable [RequestBody].
  Map<String, ReferenceOr<RequestBody>> get requestBodies;

  /// An object to hold reusable [Header].
  Map<String, ReferenceOr<Header>> get headers;

  /// An object to hold reusable [SecurityScheme].
  Map<String, ReferenceOr<SecurityScheme>> get securitySchemes;

  /// An object to hold reusable [Link].
  Map<String, ReferenceOr<Link>> get links;

  /// An object to hold reusable [Callback].
  Map<String, ReferenceOr<Callback>> get callbacks;

  /// An object to hold reusable [PathItem].
  Map<String, ReferenceOr<PathItem>> get pathItems;
}
