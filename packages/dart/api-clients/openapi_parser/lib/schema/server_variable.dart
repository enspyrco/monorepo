import '../utils/annotations.dart';

// Spec page in Notion:

/// An object representing a Server Variable for server URL template substitution.
///
/// This object MAY be extended with Specification Extensions.
abstract class ServerVariable {
  /// An enumeration of string values to be used if the substitution options are
  /// from a limited set. The array MUST NOT be empty.
  @parserSettings(jsonName: 'enum')
  List<String> get enumField;

  /// REQUIRED. The default value to use for substitution, which SHALL be sent if
  /// an alternate value is not supplied. Note this behavior is different than the
  /// Schema Object's treatment of default values, because in those cases
  /// parameter values are optional. If the enum is defined, the value MUST exist
  /// in the enum's values.
  @parserSettings(jsonName: 'default')
  String get defaultField;

  /// An optional description for the server variable.
  /// https://spec.commonmark.org/ MAY be used for rich text representation.
  String get description;
}
