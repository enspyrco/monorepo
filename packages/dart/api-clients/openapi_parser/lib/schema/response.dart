import '../utils/types.dart';
import 'header.dart';
import 'media_type.dart';
import 'reference.dart';

// Spec page in Notion: https://www.notion.so/reference-material/Response-Object-bd4dd9bb76074faea3c203396e834eef

/// Describes a single response from an API Operation, including design-time,
/// static links to operations based on the response.
///
/// This object MAY be extended with Specification Extensions.
abstract class Response {
  /// REQUIRED. A description of the response. https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// Maps a header name to its definition.
  /// https://tools.ietf.org/html/rfc7230#page-22 states header names are case insensitive.
  /// If a response header is defined with the name "Content-Type", it SHALL be ignored.
  Map<String, ReferenceOr<Header>> get headers;

  /// A map containing descriptions of potential response payloads. The key is a
  /// media type or https://tools.ietf.org/html/rfc7231#appendix-D and the value
  /// describes it.
  /// For responses that match multiple keys, only the most specific key is
  /// applicable. e.g. text/plain overrides text/*
  Map<String, ReferenceOr<MediaType>> get content;

  /// A map of operations links that can be followed from the response. The key
  /// of the map is a short name for the link, following the naming constraints
  /// of the names for [Component] Objects.
  Map<String, ReferenceOr<Reference>> get links;
}
