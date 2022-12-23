import '../utils/types.dart';
import 'components.dart';
import 'external_documentation.dart';
import 'info.dart';
import 'path_item.dart';
import 'paths.dart';
import 'security_requirement.dart';
import 'server.dart';
import 'tag.dart';

// Spec page in Notion:

/// This is the root object of the OpenAPI document.
///
/// This object MAY be extended with Specification Extensions.
abstract class OpenApi {
  /// REQUIRED. This string MUST be the version number of the OpenAPI Specification
  /// that the OpenAPI document uses. The openapi field SHOULD be used by tooling
  /// to interpret the OpenAPI document. This is not related to the API
  /// info.version string.
  String get openapi;

  /// REQUIRED. Provides metadata about the API. The metadata MAY be used by tooling as required.
  Info get info;

  /// The default value for the $schema keyword within Schema Objects contained
  /// within this OAS document. This MUST be in the form of a URI.
  String get jsonSchemaDialect;

  /// An array of Server Objects, which provide connectivity information to a
  /// target server. If the servers property is not provided, or is an empty array,
  /// the default value would be a Server Object with a url value of /.
  List<Server> get servers;

  /// The available paths and operations for the API.
  Paths get paths;

  /// The incoming webhooks that MAY be received as part of this API and that the
  /// API consumer MAY choose to implement. Closely related to the callbacks
  /// feature, this section describes requests initiated other than by an API
  /// call, for example by an out of band registration. The key name is a unique
  /// string to refer to each webhook, while the (optionally referenced) Path Item
  /// Object describes a request that may be initiated by the API provider and the
  /// expected responses. An https://www.notion.so/examples/v3.1/webhook-example.yaml
  /// is available.
  Map<String, ReferenceOr<PathItem>> get webhooks;

  /// An element to hold various schemas for the document.
  Components get components;

  /// A declaration of which security mechanisms can be used across the API.
  /// The list of values includes alternative security requirement objects that
  /// can be used. Only one of the security requirement objects need to be
  /// satisfied to authorize a request.
  /// Individual operations can override this definition.
  /// To make security optional, an empty security requirement ({}) can be
  /// included in the array.
  List<SecurityRequirement> get security;

  /// A list of tags used by the document with additional metadata. The order of
  /// the tags can be used to reflect on their order by the parsing tools. Not
  /// all tags that are used by the Operation Object must be declared. The tags
  /// that are not declared MAY be organized randomly or based on the tools' logic.
  /// Each tag name in the list MUST be unique.
  List<Tag> get tags;

  /// Additional external documentation.
  ExternalDocumentation get externalDocs;
}
