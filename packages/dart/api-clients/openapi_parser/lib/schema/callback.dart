import 'package:openapi_parser/utils/annotations.dart';

import '../utils/types.dart';
import 'path_item.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Callback-Object-da953ee73ba64e9fa67c96d67471a710

/// A map of possible out-of band callbacks related to the parent operation.
/// Each value in the map is a [PathItem] that describes a set of requests that
/// may be initiated by the API provider and the expected responses.
///
/// The key value used to identify the path item object is an expression,
/// evaluated at runtime, that identifies a URL to use for the callback operation.
///
/// To describe incoming requests from the API provider independent from another
/// API call, use the [webhooks] field.
///
/// This object MAY be extended with Specification Extensions.
abstract class Callback {
  /// A Path Item Object, or a reference to one, used to define a callback
  /// request and expected responses.
  /// A https://www.notion.so/examples/v3.0/callback-example.yaml is available.
  @parserSettings(pattern: true)
  ReferenceOr<PathItem> get expression;
}
