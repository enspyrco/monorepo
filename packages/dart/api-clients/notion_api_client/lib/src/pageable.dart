import 'package:api_client_utils/types.dart';

import 'state/blocks/block_object.dart';
import 'state/pages/page_object.dart';
import 'state/users/user_object.dart';

/// Each paginated endpoint accepts the following request parameters:
///   - for GET requests: in the query string
///   - for POST requests: in the body
class PageableRequest {
  /// A cursor returned from a previous response, used to request the next page of results. Treat this as an opaque value.
  /// Wirename: start_cursor
  /// Default: undefined, which indicates to return results from the beginning of the list.
  String? startCursor;

  ///	The number of items from the full list desired in the response.
  /// Wirename: page_size
  /// Default: 100
  /// Maximum: 100
  /// The response may contain fewer than this number of results.
  num? pageSize;
}

/// Responses from paginated endpoints contain the following properties:
class PageableResponse {
  /// When the response includes the end of the list, false. Otherwise, true.
  /// Wirename: has_more
  final bool hasMore;

  /// Only available when has_more is true.
  /// Used to retrieve the next page of results by passing the value as the
  /// start_cursor parameter to the same endpoint.
  /// Wirename: next_cursor
  final String? nextCursor;

  /// The page, or partial list, or results.
  ///   Type: array of endpoint-dependent objects
  final List<Object?> results;

  /// Always list.
  final String object = 'list';

  /// Type of the objects in results. Possible values include "block", "page",
  /// "user", "database", "property_item", "page_or_database".
  /// string (enum)
  final String type;

  /// There is also a "Pagination Type Object" with key equal to the value for the "type" key.
  ///
  /// An object containing a type-specific pagination information.
  /// Responses from paginated endpoints have keys corresponding to the value
  /// of type. Under the key is an object with type-specific pagination information.
  /// "block", "page", "user", "database" and "page_or_database" pagination type
  /// objects are empty objects.
  /// See Property item object endpoint for a description of "property_item"
  /// pagination type object.

  PageableResponse.fromJson(JsonMap json)
      : hasMore = json['has_more'] as bool,
        nextCursor = json['next_cursor'] as String?,
        results = (json['results'] as List)
            .map((e) => fromJsonFor[json['type'] as String]!(e as JsonMap))
            .toList(),
        type = json['type'] as String;
}

const Map<String, Object? Function(JsonMap)> fromJsonFor = {
  'block': BlockObject.fromJson,
  'page': PageObject.fromJson,
  'user': UserObject.fromJson,
  // 'database': DatabaseObject.fromJson,
  // 'page_or_database' : ,
  // 'property_item':
};
