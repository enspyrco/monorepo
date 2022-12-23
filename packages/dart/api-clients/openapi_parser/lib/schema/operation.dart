import '../utils/types.dart';
import 'callback.dart';
import 'external_documentation.dart';
import 'parameter.dart';
import 'request_body.dart';
import 'responses.dart';
import 'security_requirement.dart';
import 'server.dart';

// Spec page in Notion:

/// Describes a single API operation on a path.
///
/// This object MAY be extended with Specification Extensions.
abstract class Operation {
  /// A list of tags for API documentation control. Tags can be used for logical
  /// grouping of operations by resources or any other qualifier.
  List<String> get tags;

  /// A short summary of what the operation does.
  String get summary;

  /// A verbose explanation of the operation behavior.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// Additional external documentation for this operation.
  ExternalDocumentation get externalDocs;

  /// Unique string used to identify the operation. The id MUST be unique among
  /// all operations described in the API. The operationId value is case-sensitive.
  /// Tools and libraries MAY use the operationId to uniquely identify an operation,
  /// therefore, it is RECOMMENDED to follow common programming naming conventions.
  String get operationId;

  /// A list of parameters that are applicable for this operation. If a parameter
  /// is already defined at the [PathItem], the new definition will override it
  /// but can never remove it. The list MUST NOT include duplicated parameters.
  /// A unique parameter is defined by a combination of a name and location.
  /// The list can use the [Reference] to link to parameters that are defined at
  /// the OpenAPI Object's components/parameters.
  List<ReferenceOr<Parameter>> get parameters;

  /// The request body applicable for this operation.  The requestBody is fully
  /// supported in HTTP methods where the HTTP 1.1 specification
  /// https://tools.ietf.org/html/rfc7231#section-4.3.1 has explicitly defined
  /// semantics for request bodies.
  /// In other cases where the HTTP spec is vague (such as
  /// https://tools.ietf.org/html/rfc7231#section-4.3.1,
  /// https://tools.ietf.org/html/rfc7231#section-4.3.2 and
  /// https://tools.ietf.org/html/rfc7231#section-4.3.5), requestBody is permitted
  /// but does not have well-defined semantics and SHOULD be avoided if possible.
  ReferenceOr<RequestBody> get requestBody;

  /// The list of possible responses as they are returned from executing this operation.
  Responses get responses;

  /// A map of possible out-of band callbacks related to the parent operation. The
  /// key is a unique identifier for the Callback Object. Each value in the map
  /// is a [Callback] that describes a request that may be initiated by the API
  /// provider and the expected responses.
  Map<String, ReferenceOr<Callback>> get callbacks;

  /// Declares this operation to be deprecated. Consumers SHOULD refrain from
  /// usage of the declared operation. Default value is false.
  bool get deprecated;

  /// A declaration of which security mechanisms can be used for this operation.
  /// The list of values includes alternative security requirement objects that can
  /// be used. Only one of the security requirement objects need to be satisfied
  /// to authorize a request. To make security optional, an empty security
  /// requirement ({}) can be included in the array. This definition overrides any
  /// declared top-level [security]. To remove a top-level security declaration,
  /// an empty array can be used.
  List<SecurityRequirement> get security;

  /// An alternative server array to service this operation. If an alternative
  /// server object is specified at the Path Item Object or Root level, it will be
  /// overridden by this value.
  List<Server> get servers;
}
