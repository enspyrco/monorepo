import '../utils/types.dart';
import 'server.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Link-Object-9041afe97d104f6391c81066b2dbab2a

/// The `Link object` represents a possible design-time link for a response.
/// The presence of a link does not guarantee the caller's ability to
/// successfully invoke it, rather it provides a known relationship and traversal
/// mechanism between responses and other operations.
///
/// Unlike *dynamic* links (i.e. links provided **in** the response payload),
/// the OAS linking mechanism does not require link information in the runtime
/// response.
///
/// For computing links, and providing instructions to execute them, a
/// [runtime expression] is used for accessing values in an operation and using
/// them as parameters while invoking the linked operation.
///
/// This object MAY be extended with Specification Extensions.
abstract class Link {
  /// A relative or absolute URI reference to an OAS operation. This field is
  /// mutually exclusive of the operationId field, and MUST point to an [Operation].
  /// Relative operationRef values MAY be used to locate an existing [Operation]
  /// in the OpenAPI definition. See the rules for resolving [Relative References].
  String get operationRef;

  /// The name of an existing, resolvable OAS operation, as defined with a unique
  /// operationId.  This field is mutually exclusive of the operationRef field.
  String get operationId;

  /// A map representing parameters to pass to an operation as specified with
  /// operationId or identified via operationRef. The key is the parameter name
  /// to be used, whereas the value can be a constant or an expression to be
  /// evaluated and passed to the linked operation.  The parameter name can be
  /// qualified using the [parameter location] [{in}.]{name} for operations that
  /// use the same parameter name in different locations (e.g. http://path.id/).
  Map<String, ExpressionOr<Any>> get parameters;

  /// A literal value or [{expression}] to use as a request body when calling
  /// the target operation.
  ExpressionOr<Any> get requestBody;

  /// A description of the link.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// A server object to be used by the target operation.
  Server get server;
}
