// Extract the incoming value from the json in the body
import 'package:discord_interaction_to_pubsub_message/enums/application_command_type.dart';
import 'package:discord_interaction_to_pubsub_message/exceptions/invalid_command_type_exception.dart';
import 'package:discord_interaction_to_pubsub_message/exceptions/invalid_message_exception.dart';

import '../exceptions/malformed_json_exception.dart';
import '../typedefs.dart';

Map<String, Object?> extractMessageCommandInfo(JsonMap json) {
  final data = json['data'] as JsonMap? ??
      (throw MalformedJsonException('Missing "data" key.', json));

  final commandType = data['type'] as int? ??
      (throw MalformedJsonException(
          'Missing "type" key in "data" value.', json));

  // We are currently only handling command type 3 (MESSAGE)
  if (commandType != ApplicationCommandType.message.value) {
    throw InvalidCommandTypeException(
        expecting: ApplicationCommandType.message, found: commandType);
  }

  final resolved = data['resolved'] as JsonMap? ??
      (throw MalformedJsonException(
          'Missing "resolved" key in "data" value.', json));

  final messages = resolved['messages'] as JsonMap? ??
      (throw MalformedJsonException(
          'Missing "messages" key in "resolved" value.', json));

  if (messages.values.isEmpty) {
    throw MalformedJsonException('"messages" should not be empty.', json);
  }

  final firstMessage = messages.values.first as JsonMap;

  final content = firstMessage['content'] as String? ??
      (throw MalformedJsonException(
          'Missing "content" key in first value of "messages" object.', json));

  final List<String> contentLines = content.split('\n');
  if (contentLines.first != '```Dart' || contentLines.last != '```') {
    throw InvalidMessageContentException(
        'The message should start with ```Dart and end with ```');
  }

  var applicationId = json['application_id'] as String;
  var token = json['token'] as String;

  return {'content': content, 'application_id': applicationId, 'token': token};
}
