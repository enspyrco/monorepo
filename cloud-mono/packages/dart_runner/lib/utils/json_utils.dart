import 'package:dart_runner/typedefs.dart';

// Extract the incoming value from the json in the body
String extractValue(JsonMap json) {
  var data = json['data'] as JsonMap;
  var options = data['options'] as JsonList;
  var option = options.first as JsonMap;
  return option['value'] as String;
}
