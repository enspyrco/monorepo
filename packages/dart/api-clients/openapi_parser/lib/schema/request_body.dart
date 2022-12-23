import 'package:openapi_parser/utils/annotations.dart';

import 'media_type.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Request-Body-Object-145c501131d74df08850cc3e9a4229a0

/// Describes a single request body.
///
/// This object MAY be extended with Specification Extensions.
abstract class RequestBody {
  ///  A brief description of the request body. This could contain examples of use.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// REQUIRED. The content of the request body. The key is a media type or
  /// https://tools.ietf.org/html/rfc7231#appendix-D and the value describes it.
  /// For requests that match multiple keys, only the most specific key is
  /// applicable. e.g. text/plain overrides text/*
  Map<String, MediaType> get content;

  /// Determines if the request body is required in the request. Defaults to false.
  @parserSettings(jsonName: 'required')
  bool get requiredField;
}
