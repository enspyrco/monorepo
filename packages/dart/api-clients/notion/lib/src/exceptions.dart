import 'package:api_client_utils/types.dart';

/// Takes the [className] of the class where the type was not recognized,
/// as well as the [type] that was not recognized. The full [json] can
/// optionally be passed in as well.
class UnrecognizedTypeInJsonException {
  final String className;
  final Object? type;
  final JsonMap? json;

  UnrecognizedTypeInJsonException(this.className, this.type, [this.json]);

  @override
  String toString() {
    String start = (type == null)
        ? 'No type was found in'
        : 'The type $type was not recognized by';

    String end = (json == null) ? '' : '\n  json: $json';

    return '  $start `$className.fromJson` $end';
  }
}
