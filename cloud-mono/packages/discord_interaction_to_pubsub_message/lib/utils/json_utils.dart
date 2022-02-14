// Extract the incoming value from the json in the body
import '../typedefs.dart';

Map<String, String> extractInfo(JsonMap json) {
  var data = json['data'] as JsonMap;
  var options = data['options'] as JsonList;
  var option = options.first as JsonMap;
  var value = option['value'] as String;
  var applicationId = json['application_id'] as String;
  var token = json['token'] as String;

  return {'value': value, 'application_id': applicationId, 'token': token};
}
