import 'server_variable.dart';

// Spec page in Notion:

/// An object representing a Server.
///
/// This object MAY be extended with Specification Extensions.
abstract class Server {
  /// REQUIRED. A URL to the target host.  This URL supports Server Variables and
  /// MAY be relative, to indicate that the host location is relative to the
  /// location where the OpenAPI document is being served. Variable substitutions
  /// will be made when a variable is named in {brackets}.
  String get url;

  /// An optional string describing the host designated by the URL.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;

  /// A map between a variable name and its value.  The value is used for
  /// substitution in the server's URL template.
  Map<String, ServerVariable> get variables;
}
