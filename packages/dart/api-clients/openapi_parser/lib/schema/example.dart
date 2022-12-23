// Spec page in Notion: https://www.notion.so/reference-material/Example-Object-ee476b5f325a4c5bbd35c2bd5c8d33a8

import '../utils/types.dart';

/// In all cases, the example value is expected to be compatible with the type schema
/// of its associated value.  Tooling implementations MAY choose to
/// validate compatibility automatically, and reject the example value(s) if incompatible.
///
/// This object MAY be extended with Specification Extensions.
abstract class Example {
  /// Short description for the example.
  String get summary;

  /// Long description for the example. https://spec.commonmark.org/ MAY be used
  /// for rich text representation.
  String get description;

  /// Embedded literal example. The value field and externalValue field are mutually
  /// exclusive. To represent examples of media types that cannot naturally
  /// represented in JSON or YAML, use a string value to contain the example,
  /// escaping where necessary.
  Any get value;

  /// A URI that points to the literal example. This provides the capability to
  /// reference examples that cannot easily be included in JSON or YAML documents.
  /// The value field and externalValue field are mutually exclusive. See the
  /// rules for resolving [Relative References].
  String get externalValue;
}
